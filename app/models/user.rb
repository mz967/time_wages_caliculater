class User < ApplicationRecord
  include JwtToken
  authenticates_with_sorcery!
  has_many :tasks, dependent: :destroy
  validates :password, length: { in: 6..10 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, { uniqueness: true, presence: true }
  validates :name, presence: true
  validates :current_hourly_wage, { numeric: true, numericality: { greater_than_or_equal_to: 0 } }
end
