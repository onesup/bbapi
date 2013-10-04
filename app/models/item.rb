class Item < ActiveRecord::Base

  # Alias for acts_as_taggable_on :tags
  acts_as_taggable

  # Declaration of Associations
  belongs_to :owner, class_name: 'User'
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy

  
end
