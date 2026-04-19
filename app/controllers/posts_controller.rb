def index
  @posts = Post.all
  @posts = @posts.where("title LIKE ?", "%#{params[:q]}%") if params[:q].present?
  @posts = @posts.order(created_at: :desc).page(params[:page]).per(10)
end