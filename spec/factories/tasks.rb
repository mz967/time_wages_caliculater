FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "title-#{n}" }
    association :user
  end
end
