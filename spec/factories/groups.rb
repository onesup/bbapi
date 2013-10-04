require 'faker'

FactoryGirl.define do
  factory :group do
    owner_id 1
    name Faker::Name.name 
    description Faker::Lorem.sentence(10)
  end
end