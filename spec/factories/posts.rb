FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "any_rationale"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "any_rationale"
    overtime_request 4
    user
  end
end