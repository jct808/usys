class RenameActiveAdminFromOrder < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :active_admin_id, :admin_user_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
