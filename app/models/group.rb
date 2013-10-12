class Group < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members
  has_many :monthly_balances, dependent: :destroy

  # 유효성 검증 => owner_id 는 필수항목임
  validates_presence_of :owner_id
  # 유효성 검증 => 각자의 scope 내에서 그룹명(name)은 유일해야 함.
  validates_uniqueness_of :name, :scope => [:owner_id]

  # 이미 등록된 유저인 경우 true 값을 반환함.
  def added?(user)
    group_members.where( member_id: user.id ).first.present?
  end

  # 멤버유저 등록 (중복 유저인 경우 예외를 발생한다.)
  def add!(user)
    group_members.create!(member_id: user.id) unless added?(user)
  end

  # 멤버유저 삭제 (삭제시 문제가 발생하면 예외를 발생한다.)
  def remove!(user)
    group_members.find_by(member_id: user.id).destroy!
  end

end
