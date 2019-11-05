class User < ApplicationRecord
  before_save :create_uuid

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, allow_nil: true

  has_secure_password

  def create_uuid
    self.uuid = SecureRandom.uuid
  end
end
