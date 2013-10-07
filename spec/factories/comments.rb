require 'faker'

FactoryGirl.define do
  factory :comment do
    writer_id 1
    content Faker::Lorem.sentence(10)
    commentable_id 1
    commentable_type 'Item'
    
    factory :invalid_comment do
      writer_id nil
	    content Faker::Lorem.sentence(10)
	    commentable_id 1
	    commentable_type 'Item'      
    end    
  end

end