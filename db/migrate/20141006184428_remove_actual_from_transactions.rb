class RemoveActualFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :actual, :boolean
  end
end
