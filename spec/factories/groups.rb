require 'faker'

FactoryGirl.define do
  factory :group do
    sequence(owner_id) {|n| n } 
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(10) }
    

    after(:build) do | group |
      group.bookkeepings << build(:bookkeeping)
    end

    factory :invalid_group do
      owner_id nil
    end    

  end

end