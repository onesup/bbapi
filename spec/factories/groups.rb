require 'faker'

FactoryGirl.define do
  factory :group do
    owner_id 1
    name Faker::Name.name 
    description Faker::Lorem.sentence(10)
    
    factory :invalid_group do
      owner_id nil
    end    
  end

end