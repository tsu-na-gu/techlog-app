require 'rails_helper'

 RSpec.describe Post, type: :model do

   it { is_expected.to belong_to(:user) }
   it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to validate_presence_of(:body) }
   it { is_expected.to validate_length_of(:body).is_at_least(10) }
#   it "has a valid factory" do
#     post = FactoryBot.build(:post)
#     expect(post).to be_valid
#   end
end
