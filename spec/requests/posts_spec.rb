require "rails_helper"

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe "GET /posts" do
    it "returns a successful response" do
      get posts_path
      expect(response).to have_http_status(:ok)
    end

    it "displays post titles" do
      post  # let을 통해 게시글 생성
      get posts_path
      expect(response.body).to include(post.title)
    end
  end

  describe "GET /posts/:id" do
    it "returns a successful response" do
      get post_path(post)
      expect(response).to have_http_status(:ok)
    end
  end
end