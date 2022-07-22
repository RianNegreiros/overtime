FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "any_rationale"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "any_rationale"
    user
  end
end