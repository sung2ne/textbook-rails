config.action_mailer.smtp_settings = {
  address:              "smtp.sendgrid.net",
  port:                 587,
  user_name:            Rails.application.credentials.dig(:smtp, :user_name),
  password:             Rails.application.credentials.dig(:smtp, :password),
  authentication:       :plain,
  enable_starttls_auto: true
}