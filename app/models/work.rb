class Work < ApplicationRecord
  belongs_to :task
  def time_caliculator
    self.work_time = end_at - start_at
  end

  def convert_seconds_to_hours
    work_time / 60 / 60
  end

  def wage_caliculotor
    (hourly_wage * convert_seconds_to_hours).floor
  end
end
