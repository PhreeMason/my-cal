class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :location, :content
  end
end
