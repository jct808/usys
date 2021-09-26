class RenamesupllierIdTosupplierIdFromProduct < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :supllier_id, :supplier_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
