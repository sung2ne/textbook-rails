class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :granted_by, class_name: "User", optional: true

  before_create :set_granted_at

  private

  def set_granted_at
    self.granted_at = Time.current
  end
end

# 사용
user.user_roles.create(role: admin_role, granted_by: current_user)
user.user_roles.last.granted_at  # => 부여 시각