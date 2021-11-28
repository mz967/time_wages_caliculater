class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.integer :total_wage, default: 0
      t.integer :total_time, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
