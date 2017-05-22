class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.belongs_to :calendar, foreign_key: true
      t.string :name
      t.integer :days
      t.timestamps
    end
  end
end
