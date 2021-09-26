class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.integer :status
      t.integer :category_id
      t.integer :location_id
      t.integer :supllier_id
      t.integer :orderitem_id

      t.timestamps
    end
  end
end
