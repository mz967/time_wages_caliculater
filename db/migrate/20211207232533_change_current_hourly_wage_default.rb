class ChangeCurrentHourlyWageDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :current_hourly_wage, :integer, default: 0
  end
end
