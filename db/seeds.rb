AdminUser.create(email: "admin@mail.com", password: "123456", password_confirmation: "123456", first_name: "admin", last_name: "user")

puts "1 Admin User created"

User.create(email: "user@mail.com", password: "123456", password_confirmation: "123456", first_name: "user", last_name: "user")

puts "1 User created"