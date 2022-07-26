AdminUser.create(email: "admin@test.com", password: "123456", password_confirmation: "123456", first_name: "admin", last_name: "user", phone: "111111111111")

puts "1 Admin User created"

@employee = Employee.create(email: "user@test.com", password: "123456", password_confirmation: "123456", first_name: "user", last_name: "user", phone: "111111111111")

puts "1 User created"

100.times do |post|
  Post.create!(date: Date.today, work_performed: "#{post} work performed", user_id: @employee.id, daily_hours: 2.5)
end

puts "100 Posts have been created"

AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))

puts "3 audit logs have been created"