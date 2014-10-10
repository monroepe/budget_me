FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jon#{n}@doe.com" }
    password "password123"
    first_name "Jon"
    last_name "Doe"
  end
end
