class Post < ApplicationRecord
  scope :published,  -> { where(published: true) }
  scope :draft,      -> { where(published: false) }
  scope :recent,     -> { order(created_at: :desc) }
  scope :popular,    -> { order(views_count: :desc) }

  # 파라미터를 받는 스코프
  scope :by_user,    ->(user_id) { where(user_id: user_id) }
  scope :created_after, ->(date) { where("created_at > ?", date) }
  scope :limit_to,   ->(n) { limit(n) }
end