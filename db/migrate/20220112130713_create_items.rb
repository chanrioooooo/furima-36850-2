class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name,     null: false
      t.text    :explanation,      null: false
      t.string  :category_id,      null: false
      t.string  :situation_id,     null: false
      t.string  :consignor_id,     null: false
      t.string  :shipping_area_id, null: false
      t.string  :days_to_ship_id,  null: false
      t.integer :price,            null: false
      t.string  :user_id,          null: false
    end
  end
end
