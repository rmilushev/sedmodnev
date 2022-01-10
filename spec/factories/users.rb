require 'faker'
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '2323'
    password_confirmation '2323'
  end
end
