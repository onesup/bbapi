class GroupMember < ActiveRecord::Base
  belongs_to :group
  belongs_to :member, class_name: 'User'

  # 유효성 검증: 동일한 그룹에서는 member_id가 유일해야 함.
  validates_uniqueness_of :member_id, scope: [ :group_id ]
end
