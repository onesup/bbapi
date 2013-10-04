require 'spec_helper'

describe Group do
  it "owner_id 속성값은 필수항목이다." do
    group = FactoryGirl.build(:group, :owner_id => nil)
    expect(group).to have(1).errors_on(:owner_id)
  end

  it "그룹명는 각 사용자의 스코프내에서 유일해야 한다." do
    group = FactoryGirl.build(:group, owner_id: nil, name: 'Group11')
    expect(group).to have(1).errors_on(:owner_id)
    # expect(group).to have(1).errors_on(:name)
    expect(group).to be_invalid
  end
end
