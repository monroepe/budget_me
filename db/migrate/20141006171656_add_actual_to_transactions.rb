class AddActualToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :actual, :boolean, null: false, default: false
  end
end
