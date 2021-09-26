class RemoveAdminUserIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :admin_user_id, :user_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
