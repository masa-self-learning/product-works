# 19.times do |n|
#   name = "楽太郎#{n+1}"
#   email =  "rakurecipe#{n+1}@example.com"
#   user_no = 111 + n
#   password = "123456"
#   User.create!(name: name,
#                email: email,
#                user_no: user_no,
#                password: password,
#                password_confirmation: password)
# end

# users = User.order(:created_at).take(2)
# 30.times do |n|
#   from = Date.parse("2021/01/01")
#   to = Date.parse("2021/03/31")
#   term = Array(from..to)
#   date = term[n]
#   start_time = "09:00"
#   end_time = "18:00"
#   break_time = "01:00"
#   comment = 'テストテストテストテストテスト'
#   users.each { |user| user.works.create!(date: date, 
#                                          start_time: start_time,
#                                          end_time: end_time,
#                                          break_time: break_time,
#                                          comment: comment)}
# end

  name = "楽太郎"
  email =  "rakurecipe@example.com"
  user_no = 1111
  password = "123456"
  User.create!(name: name,
               email: email,
               user_no: user_no,
               password: password,
               password_confirmation: password)

30.times do |n|
  from = Date.parse("2021/01/01")
  to = Date.parse("2021/03/31")
  term = Array(from..to)
  date = term[n]
  start_time = "09:00"
  end_time = "18:00"
  break_time = "01:00"
  comment = 'テストテストテストテストテスト'
  Work.create!(user_id: 1,
               date: date, 
               start_time: start_time,
               end_time: end_time,
               break_time: break_time,
               comment: comment)
end