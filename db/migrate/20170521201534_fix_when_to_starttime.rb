class FixWhenToStarttime < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :when, :start_time
  end
end
