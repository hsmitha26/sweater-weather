class User < ApplicationRecord
  before_create :create_uuid

  has_many :trips

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password

  has_secure_password

  def create_uuid
    self.uuid = SecureRandom.uuid
  end
end
