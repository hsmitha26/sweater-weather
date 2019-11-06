require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:origin) }
    it { should validate_presence_of(:destination) }
  end

  describe 'relationship' do
    it { should belong_to :user }
  end

  describe 'instance methods' do
    it "#seconds_to_hours(seconds)" do
      user = User.create(email: "email", password: "password", password_confirmation: 'password')
      trip = Trip.create(origin: "here", destination: "there", user_id: user.id)
      seconds = 23238
      expect(trip.seconds_to_hours(seconds)).to eq(7)
    end
  end
end
