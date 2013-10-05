require 'faker'

FactoryGirl.define do
  factory :income_item do
    content Faker::Lorem.sentence(10)
    amount Faker::Number.number(5)
    owner_id 1
    issue_date '2013-10-04'
    type 'IncomeItem'
  end

  factory :outlay_item do
    content Faker::Lorem.sentence(10)
    amount Faker::Number.number(5)
    owner_id 1
    issue_date '2013-10-04'
    type 'OutlayItem'
  end  
end