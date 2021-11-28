FactoryBot.define do
  factory :task do
    title { "MyString" }
    total_wage { 1 }
    total_time { 1 }
    user { nil }
  end
end
