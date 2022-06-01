class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.date :date
      t.integer :kind
      t.float :value
      t.string :cpf
      t.string :card_number
      t.time :hour
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
