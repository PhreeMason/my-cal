class AddOrderToMonths < ActiveRecord::Migration[5.0]
  def change
    add_column :months, :order, :integer
  end
end
