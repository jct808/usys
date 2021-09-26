class AddProductIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :product_id, :integer
  end
end
