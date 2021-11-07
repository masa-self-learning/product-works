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
  name = "デモ社員#{n+1}"
  email = "demo#{n+1}@example.com"
  user_no = "111#{n+1}"
  password = "123456"
  User.create!(name: name,
               email: email,
               user_no: user_no,
               password: password,
               password_confirmation: password)
end               

 9.times do |n|
  name = "太郎#{n}"
  email =  "taro#{n}@example.com"
  user_no = "222#{n}"
  password = "123456"
  User.create!(name: name,
               email: email,
               user_no: user_no,
               password: password,
               password_confirmation: password)
end

9.times do |m|
  61.times do |n|
    from = Date.parse("2021/10/01")
    to = Date.parse("2021/11/07")
    term = Array(from..to)
    date = term[n]
    start_time = "09:00"
    end_time = "18:00"
    break_time = "01:00"
    comment = 'テストテストテストテストテスト'
    Work.create!(user_id: m+1,
                 date: date, 
                 start_time: start_time,
                 end_time: end_time,
                 break_time: break_time,
                 comment: comment)
  end               
end