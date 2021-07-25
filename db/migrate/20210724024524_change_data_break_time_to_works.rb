class ChangeDataBreakTimeToWorks < ActiveRecord::Migration[5.2]
  def change
    change_column :works, :break_time, :string
  end
end
