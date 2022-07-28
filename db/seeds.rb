@user = User.create(email: "user@mail.com", password: "123456", password_confirmation: "123456", first_name: "user", last_name: "user", phone: "111111111111")

puts "1 User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"