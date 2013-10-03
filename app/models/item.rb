class Item < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
end
