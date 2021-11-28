FactoryBot.define do
  factory :work do
    start_at { "2021-11-27 09:01:42" }
    end_at { "2021-11-27 09:01:42" }
    work_time { 1 }
    hourly_wage { 1 }
    task { nil }
  end
end
