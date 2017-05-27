class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.datetime :start_time
      t.belongs_to :month
      t.belongs_to :calendar
      t.timestamps
    end
  end
end
