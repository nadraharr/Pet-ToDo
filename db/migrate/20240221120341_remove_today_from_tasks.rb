class RemoveTodayFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :today, :boolean
  end
end
