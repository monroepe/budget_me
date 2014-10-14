class ChangeDateToNecessary < ActiveRecord::Migration
  def up
    change_column :transactions, :date, :date, null: false
  end

  def down
    change_column :transactions, :date, :date
  end
end
