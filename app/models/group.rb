class Group < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'

  # 유효성 검증 => 본인이 생성한 Group명은 유일해야 한다.
  validates_uniqueness_of :name, :scope => [:owner_id]
  
end
