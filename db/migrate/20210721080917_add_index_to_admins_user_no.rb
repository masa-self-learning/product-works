class AddIndexToAdminsUserNo < ActiveRecord::Migration[5.2]
  def change
    add_index :admins, :user_no, unique: true
  end
end
