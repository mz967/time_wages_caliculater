class Task < ApplicationRecord
  belongs_to :user
  has_many :works, dependent: :destroy
  validates :title, { presence: true, length: { maximum: 30 } }

  def add_total_data(work)
    self.total_time += work.work_time
    self.total_wage += work.work_wage
  end
end
