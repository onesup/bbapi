class Like < ActiveRecord::Base
  #belongs_to :user
	belongs_to :likeable, polymorphic: true, counter_cache: true
  belongs_to :liker, class_name: 'User', foreign_key: :user_id  
end
