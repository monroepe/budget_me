class RemoveDateFromBudgetItems < ActiveRecord::Migration
  def change
    remove_column :budget_items, :date, :date
  end
end
