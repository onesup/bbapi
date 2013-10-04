FactoryGirl.define do
  factory :group do
    owner_id 1
    sequence(:name) { |n| "Group#{n}"}
    sequence(:description) { |n| "Description#{n}"}
  end
end