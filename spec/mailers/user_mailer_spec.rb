require "rails_helper"

RSpec.describe UserMailer do
  describe "#welcome_email" do
    let(:user) { create(:user) }
    let(:mail) { described_class.welcome_email(user) }

    it "올바른 수신자에게 발송" do
      expect(mail.to).to eq([user.email])
    end

    it "올바른 제목" do
      expect(mail.subject).to eq("환영합니다!")
    end

    it "사용자 이름 포함" do
      expect(mail.body.encoded).to include(user.name)
    end
  end
end

# Request Spec에서 이메일 큐 검증
it "회원가입 시 환영 이메일을 큐에 추가" do
  expect {
    post user_registration_path, params: { user: { email: "test@example.com", password: "password" } }
  }.to have_enqueued_mail(UserMailer, :welcome_email)
end