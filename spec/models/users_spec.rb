require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  destination 'relationship' do
    it { should have_many :trips }
  end

  it "tests SecureRandom" do
    uuid = "abcdefgh12345"
    user = User.create(email: "email", password: "password", password_confirmation: 'password')
    user.uuid = uuid
    allow(SecureRandom).to receive(:uuid).and_return(uuid)
    expect(user.create_uuid).to eq(uuid)
  end
end
