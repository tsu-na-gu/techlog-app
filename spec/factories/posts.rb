FactoryBot.define do
  factory :post do
    user_id { (:user) }
    sequence(:title) { |n| "This is a post title#{n}"}
    sequence(:body) { |n| "This is a important content#{n}"}
  end
end
