class Work < ApplicationRecord
  before_update :change_evaluation
  belongs_to :task

  # scope :work_date, -> { where(created_at: Time.current.beginning_of_month..Time.current.end_of_month).group('date(created_at)') }
  # scope :work_month, -> { where(created_at: Time.current.beginning_of_year..Time.current.end_of_year).group('month(created_at)') }

  def time_caliculator
    self.work_time = end_at - start_at
  end

  def wage_caliculator
    self.work_wage = (hourly_wage * work_time / 60 / 60).floor
  end

  def change_evaluation
    self.evaluation = evaluation * work_wage
  end
end
