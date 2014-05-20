FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "est#{n}@example.com" }
    password '123456789'
    password_confirmation '123456789'
  end
end