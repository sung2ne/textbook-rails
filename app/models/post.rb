class Post < ApplicationRecord
  scope :published, -> { where(published: true) }
  scope :recent,    -> { order(created_at: :desc) }

  def excerpt(length: 100)
    body.truncate(length)
  end

  def reading_time
    words = body.split.size
    (words / 200.0).ceil  # 분당 200단어
  end
end

# spec/models/post_spec.rb
RSpec.describe Post, type: :model do
  describe ".published" do
    it "returns only published posts" do
      published   = create(:post, published: true)
      unpublished = create(:post, published: false)

      expect(Post.published).to include(published)
      expect(Post.published).not_to include(unpublished)
    end
  end

  describe "#excerpt" do
    it "truncates body to 100 characters by default" do
      post = build(:post, body: "a" * 200)
      expect(post.excerpt.length).to eq(100)
    end

    it "truncates body to specified length" do
      post = build(:post, body: "a" * 200)
      expect(post.excerpt(length: 50).length).to eq(50)
    end
  end

  describe "#reading_time" do
    it "calculates reading time based on word count" do
      post = build(:post, body: "word " * 400)
      expect(post.reading_time).to eq(2)  # 400단어 / 200 = 2분
    end
  end
end