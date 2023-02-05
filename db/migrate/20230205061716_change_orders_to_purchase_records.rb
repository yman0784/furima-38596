class ChangeOrdersToPurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    rename_table :orders, :purchase_records
  end
end
