require 'faker'

FactoryGirl.define do
  factory :income_category do
    name Faker::Lorem.word
    description Faker::Lorem.sentence(10)
    owner_id 1
    type 'IncomeCategory'
  end

  factory :outlay_category do
    name Faker::Lorem.word
    description Faker::Lorem.sentence(10)
    owner_id 1
    type 'OutlayCategory'
  end  
end