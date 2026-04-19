class UserMailer < ApplicationMailer
  default from: "noreply@example.com"

  def welcome_email(user)
    @user = user
    @login_url = new_user_session_url

    mail(
      to:      user.email,
      subject: "#{user.name}님, 가입을 환영합니다."
    )
  end

  def password_reset(user, token)
    @user  = user
    @token = token
    @reset_url = edit_user_password_url(reset_password_token: token)

    mail(
      to:      user.email,
      subject: "비밀번호 재설정 안내"
    )
  end
end