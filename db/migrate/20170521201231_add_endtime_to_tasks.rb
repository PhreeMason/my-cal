class AddEndtimeToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :endtime, :datetime
  end
end
