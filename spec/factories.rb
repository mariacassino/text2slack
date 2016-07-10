FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "email@example#{n}.com" }
    password "hunter2"
    phone "13057610875"
    slack_token "abcdefg"
    channel "general"
  end

  factory :blank_token_user, class: :user do
    sequence(:email) { |n| "email@example#{n}.com" }
    password "hunter2"
    phone "13057610875"
    channel "general"
  end

end
