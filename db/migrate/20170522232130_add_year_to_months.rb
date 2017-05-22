class AddYearToMonths < ActiveRecord::Migration[5.0]
  def change
    add_column :months, :year, :integer
  end
end
