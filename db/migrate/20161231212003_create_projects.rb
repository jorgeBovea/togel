class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.boolean :default
      t.string  :name
      t.integer :number_hour
      t.integer :number_min
      t.integer :number_seconds
      t.date    :fin_date
      t.timestamps
    end
  end
end
