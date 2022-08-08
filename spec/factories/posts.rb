FactoryGirl.define do
  factory :post do
    date Date.today
    work_performed "any_work_performed"
    daily_hours 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    work_performed "any_work_performed"
    daily_hours 4
    user
  end
end