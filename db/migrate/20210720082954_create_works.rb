class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.integer :user_id
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :break_time
      t.text :comment

      t.timestamps
    end
  end
end
