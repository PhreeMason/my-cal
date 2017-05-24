class ChangeDateTypeInTasks < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :day, :date
  end
end
