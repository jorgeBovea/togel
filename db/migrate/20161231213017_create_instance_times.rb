class CreateInstanceTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :instance_times do |t|
      t.integer :instance_id
      t.string  :time_mark
      t.integer :hour
      t.integer :minutes
      t.integer :seconds
      t.timestamps
    end
  end
end
