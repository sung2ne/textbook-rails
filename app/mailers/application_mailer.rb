class ApplicationMailer < ActionMailer::Base
  default from: "noreply@example.com"
  layout "mailer"

  # SMTP 오류 발생 시 최대 3번, 지수 백오프로 재시도
  rescue_from Net::SMTPFatalError, Net::SMTPServerBusy do |exception|
    logger.error "이메일 발송 실패: #{exception.message}"
    raise exception  # Active Job의 retry_on이 처리하도록 다시 raise
  end
end