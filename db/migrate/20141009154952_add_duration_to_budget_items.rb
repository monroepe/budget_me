class AddDurationToBudgetItems < ActiveRecord::Migration
  def change
    add_column :budget_items, :duration_id, :integer, null: false
  end
end
