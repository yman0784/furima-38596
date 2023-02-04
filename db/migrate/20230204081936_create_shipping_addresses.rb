class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :postal_code,         null: false
      t.integer    :prefecture_id,       null: false
      t.string     :municipalities,      null: false
      t.string     :address,             null: false
      t.string     :building_name
      t.string     :telephone_number,    null: false
      t.references :order,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
