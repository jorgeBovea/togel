class CreateInstances < ActiveRecord::Migration[5.0]
  def change
    create_table :instances do |t|
      t.integer :project_id
      t.string :description
      t.integer :user_id
      t.integer :total_time
      t.date    :final_time
      t.timestamps
    end
  end
end
