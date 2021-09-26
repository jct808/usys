class RenameUserIdToActiveAdminFromOrder < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :user_id, :active_admin_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
