class CreateYogaSessions < ActiveRecord::Migration
  def change
    create_table :yoga_sessions do |t|
      t.string :day
      t.string :name
      t.integer :instructor_id
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
