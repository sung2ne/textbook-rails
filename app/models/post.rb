class Post < ApplicationRecord
  validates :title,   presence: true,
                      length: { minimum: 2, maximum: 100 }
  validates :content, presence: true,
                      length: { minimum: 10 }
  validates :slug,    presence: true,
                      uniqueness: true,
                      format: { with: /\A[a-z0-9-]+\z/, message: "소문자, 숫자, 하이픈만 허용됩니다" }
  validates :views_count, numericality: { greater_than_or_equal_to: 0 }
  validates :status,  inclusion: { in: %w[draft published archived] }
end