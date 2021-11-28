class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :work_time, null: false
      t.integer :hourly_wage, null: false
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
