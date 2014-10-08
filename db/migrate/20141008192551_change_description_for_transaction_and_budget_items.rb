class ChangeDescriptionForTransactionAndBudgetItems < ActiveRecord::Migration
  def up
    change_column :transactions, :description, :string
    change_column :budget_items, :description, :string
  end

  def down
    change_column :transactions, :description, :text
    change_column :budget_items, :description, :text
  end
end
