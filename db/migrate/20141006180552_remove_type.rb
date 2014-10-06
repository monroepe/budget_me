class RemoveType < ActiveRecord::Migration
  def up
    drop_table :types

    remove_column :transactions, :type_id
  end

  def down
    create_table :types do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_column :transactions, :type_id, :integer
  end
end
