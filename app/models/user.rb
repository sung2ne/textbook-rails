class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles
end

# app/models/role.rb
class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles
end

# app/models/user_role.rb
class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
end