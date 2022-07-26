FactoryGirl.define do
  sequence :email do |n|
    "any#{n}@mail.com"
  end

  factory :user do
    first_name 'any_name'
    last_name 'any_name'
    email { generate :email }
    password 'any_password'
    password_confirmation 'any_password'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'any_name'
    last_name 'any_name'
    email { generate :email }
    password 'any_password'
    password_confirmation 'any_password'
    type 'AdminUser'
  end

  factory :non_authorized_user, class: "User" do
    first_name 'any_name'
    last_name 'any_name'
    email { generate :email }
    password 'any_password'
    password_confirmation 'any_password'
  end
end