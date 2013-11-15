class Comment < ActiveRecord::Base
  belongs_to :writer, class_name: 'User'
  belongs_to :commentable, polymorphic: true

  # 유효성 검증 => writer_id, commentable_id 는 필수항목임
  validates_presence_of :writer_id , :commentable_id
end
