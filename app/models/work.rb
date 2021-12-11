class Work < ApplicationRecord
  belongs_to :task
  def time_caliculator
    self.work_time = end_at - start_at
  end

  def wage_caliculator
    (hourly_wage * work_time / 60 / 60).floor
  end
end
