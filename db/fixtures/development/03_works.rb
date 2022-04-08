Work.seed do |s|
  s.id = 1
  s.start_at = '2022-01-01 00:00:00'
  s.end_at = '2022-01-01 02:00:00'
  s.work_time  = 7200
  s.hourly_wage  = 1000
  s.task_id  = 1
  s.work_wage  = 2000
  s.evaluation = 16000
  s.created_at = '2022-01-01 02:00:00'
end

Work.seed do |s|
  s.id = 2
  s.start_at = '2022-02-05 00:00:00'
  s.end_at = '2022-02-02 05:00:00'
  s.work_time  = 18000
  s.hourly_wage  = 1000
  s.task_id  = 1
  s.work_wage  = 5000
  s.evaluation = 15000
  s.created_at = '2022-02-05 05:00:00'
end

Work.seed do |s|
  s.id = 3
  s.start_at = '2022-03-11 00:00:00'
  s.end_at = '2022-03-11 03:00:00'
  s.work_time  = 10800
  s.hourly_wage  = 1000
  s.task_id  = 1
  s.work_wage  = 3000
  s.evaluation = 18000
  s.created_at = '2022-03-11 03:00:00'
end