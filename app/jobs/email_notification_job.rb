class EmailNotificationJob < ApplicationJob
  queue_as :default

  retry_on StandardError, wait: :polynomially_longer, attempts: 3

  discard_on ActiveJob::DeserializationError

  def perform(user_id, message)
    user = User.find(user_id)
    UserMailer.notification(user, message).deliver_now
  rescue => e
    Sentry.capture_exception(e, extra: { user_id: user_id })
    raise  # 재시도를 위해 예외를 다시 발생
  end
end