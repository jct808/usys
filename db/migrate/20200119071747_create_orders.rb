class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :customer
      t.string :phone
      t.string :address
      t.integer :total
      t.date :shipping_date
      t.integer :user_id

      t.timestamps
    end
  end
end
