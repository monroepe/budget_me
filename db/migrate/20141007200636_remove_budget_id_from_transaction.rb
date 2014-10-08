class RemoveBudgetIdFromTransaction < ActiveRecord::Migration
  def change
    remove_column :transactions, :budget_id, :integer

    add_column :transactions, :user_id, :integer, null: false
  end
end
