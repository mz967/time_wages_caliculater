class AddColumnWorksWorkwageAndEvaluation < ActiveRecord::Migration[6.0]
  def up
    add_column :works, :work_wage, :integer, null: false
    add_column :works, :evaluation, :integer
  end

  def down
    remove_column :works, :work_wage, :integer, null: false
    remove_column :works, :evaluation, :integer
  end
end
