class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :location
      t.datetime :when

      t.timestamps
    end
  end
end
