class FixStartTime < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :start_time, :time
  end
end
