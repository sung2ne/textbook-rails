FactoryBot.define do
  factory :comment do
    body      { Faker::Lorem.paragraph }
    association :post
    association :user
  end
end

# 테스트에서 사용
RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  it "belongs to a post and user" do
    comment = create(:comment, post: post, user: user)
    expect(comment.post).to eq(post)
    expect(comment.user).to eq(user)
  end
end