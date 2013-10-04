# encoding: UTF-8

require 'spec_helper'

describe Group do
  it "owner_id 속성값은 필수항목이다." do
    group = build(:group, :owner_id => nil)
    expect(group).to have(1).errors_on(:owner_id)
  end

  it "그룹명은 각 사용자의 스코프내에서 유일해야 한다." do
    create(:group, owner_id: 1, name: 'Group1')
    group = build(:group, owner_id: 1, name: 'Group1')
    expect(group).to have(1).errors_on(:name)
  end

  it "added? 메소드를 이용하면 특정 유저의 등록여부를 알 수 있다." do
    user = create(:user)
    group = create(:group, owner_id: 1, name: 'Group1')
    member = group.members.where( id: user.id).first
    expect(member.present?).to eq group.added? user
  end

  it "add! 메소드를 이용하여 멤버를 추가할 수 있다." do
    user = create(:user)
    group = create(:group, owner_id: 1, name: 'Group1')
    group.add!(user)
    expect(group.members.where(id:user.id).first).to eq user
  end

  it "remove! 메소드를 이용하여 멤버를 삭제할 수 있다." do
    user = create(:user)
    group = create(:group, owner_id: 1, name: 'Group1')
    group.add!(user)
    group.remove!(user)
    expect(group.added?(user)).to be_false    
  end
end
