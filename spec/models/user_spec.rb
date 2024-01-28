require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to validate_uniqueness_of(:email) }
    end
    describe "email validation" do

      let(:user) { build(:user) }

      it "is invalid with invalid email address" do
        invalid_addresses =  %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |address|
          user.email = address
          expect(user).not_to be_valid
        end
      end
  end
end

