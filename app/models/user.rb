class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, allow_nil: true

  has_secure_password
end
