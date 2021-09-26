class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :unit_price
      t.integer :quantity
      t.integer :order_id

      t.timestamps
    end
  end
end
