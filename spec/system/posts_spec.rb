require "rails_helper"

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user, password: "password123") }

  describe "게시글 작성 시나리오" do
    before do
      # 로그인
      visit new_user_session_path
      fill_in "이메일", with: user.email
      fill_in "비밀번호", with: "password123"
      click_button "로그인"
      expect(page).to have_content("로그인되었습니다.")
    end

    it "사용자가 게시글을 작성하면 목록에 나타난다" do
      visit new_post_path

      fill_in "제목", with: "첫 번째 게시글"
      fill_in "내용", with: "내용을 입력합니다."
      click_button "작성하기"

      expect(page).to have_content("게시글이 작성되었습니다.")
      expect(page).to have_content("첫 번째 게시글")
    end

    it "제목 없이 게시글을 작성하면 오류가 표시된다" do
      visit new_post_path

      fill_in "제목", with: ""
      fill_in "내용", with: "내용입니다."
      click_button "작성하기"

      expect(page).to have_content("제목을 입력해주세요")
    end
  end

  describe "게시글 삭제 시나리오" do
    let!(:post) { create(:post, user: user) }

    before { sign_in user }

    it "게시글을 삭제하면 목록에서 사라진다" do
      visit posts_path
      expect(page).to have_content(post.title)

      within "#post-#{post.id}" do
        click_link "삭제"
      end

      # 삭제 확인 다이얼로그 처리
      accept_confirm

      expect(page).not_to have_content(post.title)
      expect(page).to have_content("게시글이 삭제되었습니다.")
    end
  end
end