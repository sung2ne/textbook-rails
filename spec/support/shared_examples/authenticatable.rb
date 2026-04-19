RSpec.shared_examples "로그인 필요" do
  context "비로그인 상태" do
    it "로그인 페이지로 리다이렉트" do
      subject
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

# spec/requests/posts_spec.rb
describe "POST /posts" do
  subject { post posts_path, params: { post: { title: "제목" } } }
  it_behaves_like "로그인 필요"
end