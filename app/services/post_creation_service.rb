class PostCreationService
  attr_reader :post, :errors

  def initialize(user:, params:, tag_list: nil)
    @user = user
    @params = params
    @tag_list = tag_list
    @errors = []
  end

  def call
    build_post
    return false unless @post.valid?

    ActiveRecord::Base.transaction do
      @post.save!
      process_tags
      send_notifications
      index_for_search
    end

    true
  rescue ActiveRecord::RecordInvalid => e
    @errors << e.message
    false
  end

  private

  def build_post
    @post = @user.posts.build(@params)
  end

  def process_tags
    @post.tag_list = @tag_list if @tag_list.present?
    @post.save!
  end

  def send_notifications
    PostMailer.notify_followers(@user, @post).deliver_later
  end

  def index_for_search
    SearchIndexJob.perform_later(@post.id)
  end
end