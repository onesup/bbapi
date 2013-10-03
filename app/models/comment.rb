class Comment < ActiveRecord::Base
  belongs_to :writer
  belongs_to :commentable
end
