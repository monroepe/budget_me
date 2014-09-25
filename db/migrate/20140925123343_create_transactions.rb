class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name, null: false
      t.decimal :amount, null: false, precision: 8, scale: 2
      t.integer :type_id
      t.text :description
      t.integer :budget_id, null: false

      t.timestamps
    end
  end
end
