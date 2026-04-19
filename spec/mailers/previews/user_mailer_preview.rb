class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.welcome_email(User.first)
  end

  def password_reset
    UserMailer.password_reset(User.first, "dummy_token_for_preview")
  end
end