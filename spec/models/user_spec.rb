require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    FactoryBot.create(:user)
  end
  let(:user) { FactoryBot.build(:user) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should have_many(:tasks) }
end
