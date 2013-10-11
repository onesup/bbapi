# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ email: 'tester1@bbapi.com', password: '12341234'}, { email: 'tester2@bbapi.com', password: '12341234'}])
user = users[0]

group = Group.create({ name: 'babi group', description: 'babi group', owner: user})

users.each do |user|
	GroupMember.create({ group: group, member: user })
end

account_categories = AccountCategory.create([
  { name: '자산'},
  { name: '자산'},
  { name: '자산'},
  { name: '자산'},
  { name: '자산'},
])

income_categories = IncomeCategory.create([
	{ name: '용돈', description: '용돈', owner: user}, 
	{ name: '월급', description: '월급', owner: user}, 
	{ name: '보너스', description: '보너스', owner: user}, 
	{ name: '수당', description: '수당', owner: user}, 
	{ name: '기타', description: '기타', owner: user}	
	])

outlay_categories = OutlayCategory.create([
	{ name: '문화', description: '문화', owner: user}, 
	{ name: '식사', description: '식사', owner: user}, 
	{ name: '사회생활', description: '사회생활', owner: user},
	{ name: '교통비', description: '교통비', owner: user},
	{ name: '건강', description: '건강', owner: user},
	{ name: '교육', description: '교육', owner: user},
	{ name: '자기계발', description: '자기계발', owner: user},
	{ name: '경조사', description: '경조사', owner: user},
	{ name: '생필품', description: '생필품', owner: user},
	{ name: '의복', description: '의복', owner: user},
	{ name: '미용', description: '미용', owner: user},
	{ name: '기타', description: '기타', owner: user}
	])

income_items = IncomeItem.create([
	{category: income_categories[0], owner: user, content: '10월 용돈', amount: 100000, issue_date: '2013-10-01'},
	{category: income_categories[3], owner: user, content: '10월 보너스', amount: 50000, issue_date: '2013-10-04'}
	])

outlay_items = OutlayItem.create([
	{category: outlay_categories[0], owner: user, content: '영화', amount: 9000, issue_date: '2013-10-03'},
	{category: outlay_categories[1], owner: user, content: '아침', amount: 20000, issue_date: '2013-10-04'}
	])

income_items.each do |income_item|
	Comment.create({writer: user, content: 'this is comment.', commentable: income_item})
end

outlay_items.each do |outlay_item|
	Comment.create({writer: user, content: 'this is comment.', commentable: outlay_item})
end
