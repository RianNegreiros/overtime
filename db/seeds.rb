@user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", fist_name: "any", last_name: "any")

puts "User has been created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content")
end

puts "100 Posts have been created"