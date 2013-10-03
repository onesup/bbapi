class Item < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :category
end
