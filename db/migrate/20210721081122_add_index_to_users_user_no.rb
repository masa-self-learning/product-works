class AddIndexToUsersUserNo < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :user_no, unique: true
  end
end
