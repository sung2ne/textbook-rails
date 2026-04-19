RSpec.describe Post, type: :model do
  # 유효성 검사
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:title).is_at_most(200) }
  it { is_expected.to validate_uniqueness_of(:slug) }

  # 연관관계
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:tags).through(:post_tags) }
end