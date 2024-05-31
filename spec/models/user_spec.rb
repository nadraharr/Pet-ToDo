require 'rails_helper'

RSpec.describe User, type: :model do
  before { create(:user) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
  end

  describe 'associations' do    
    it { should have_many(:tasks) }
  end
end
