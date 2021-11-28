class Task < ApplicationRecord
  belongs_to :user
  has_many :works
  validates :title, presence: true
end
