class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :owner_name
      t.decimal :balance, precision: 8, scale: 2, default: "0.0"
      t.timestamps
    end
  end
end
