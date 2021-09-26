class RemoveOrderitemIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :orderitem_id
  end
end
