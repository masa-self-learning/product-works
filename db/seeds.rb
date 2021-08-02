name = "管理者"
email =  "kanri@example.com"
user_no = "0000"
password = "123456"
Admin.create!(name: name,
             email: email,
             user_no: user_no,
             password: password,
             password_confirmation: password)

 9.times do |n|
  name = "太郎#{n+1}"
  email =  "taro#{n+1}@example.com"
  user_no = "111#{n}"
  password = "123456"
  User.create!(name: name,
               email: email,
               user_no: user_no,
               password: password,
               password_confirmation: password)
end

30.times do |n|
  from = Date.parse("2021/06/01")
  to = Date.parse("2021/06/30")
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