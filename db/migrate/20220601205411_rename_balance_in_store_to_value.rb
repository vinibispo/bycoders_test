class RenameBalanceInStoreToValue < ActiveRecord::Migration[7.0]
  def change
    rename_column :stores, :balance, :value
  end
end
