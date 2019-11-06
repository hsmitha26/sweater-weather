require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:origin) }
    it { should validate_presence_of(:destination) }
  end

  destination 'relationship' do
    it { should belong_to :user }
  end
end
