require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
end