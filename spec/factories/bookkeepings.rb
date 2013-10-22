require 'faker'

FactoryGirl.define do
  factory :bookkeeping do
    group_id 1
    writer_id 1
    issuer_id 1
    issue_date Date.new
    operator "+"
    account_title_id 1
    remark "여기는 적요란입니다. "
    amount 5000
    content "여기는 메시지를 기록하는 필드입니다."   

    factory :invalid_bookkeeping do
      group_id nil
    end
  end

end