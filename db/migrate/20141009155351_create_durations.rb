class CreateDurations < ActiveRecord::Migration
  def change
    create_table :durations do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
