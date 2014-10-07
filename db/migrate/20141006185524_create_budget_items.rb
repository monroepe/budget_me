class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.decimal :amount, null: false
      t.integer :budget_id, null: false
      t.integer :category_id, null: false
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
