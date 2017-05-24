class FixEndTime < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :endtime, :day
  end
end
