# 5.times {
#   Task.seed do |s|
#     s.title = Faker::Hobby.activity
#     s.total_wage = rand(500000)
#     s.total_time  = rand(1800000)
#     s.user_id = 1
#   end
# }

Task.seed do |s|
  s.id = 1
  s.title = 'A社へ訪問販売'
  s.total_wage = 10000
  s.total_time  = 36000
  s.user_id = 1
end

Task.seed do |s|
  s.id =2
  s.title = '顧客リストの作成'
  s.total_wage = 20000
  s.total_time  = 72000
  s.user_id = 1
end
