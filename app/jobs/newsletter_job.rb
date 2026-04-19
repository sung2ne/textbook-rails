class NewsletterJob < ApplicationJob
  queue_as :low

  def perform(newsletter_id)
    newsletter = Newsletter.find(newsletter_id)

    User.active.find_each(batch_size: 100) do |user|
      # 각 사용자마다 개별 잡을 큐에 넣고, 발송 간격을 둠
      UserMailer.newsletter(user, newsletter)
               .deliver_later(wait: rand(1..10).seconds)
    end
  end
end