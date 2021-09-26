class RemoveActiveAdminTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :active_admin_comments if (table_exists? :active_admin_comments)
    drop_table :active_admin_managed_resources if (table_exists? :active_admin_managed_resources)
    drop_table :active_admin_permissions if (table_exists? :active_admin_permissions)
    drop_table :admin_users if (table_exists? :admin_users)
  end
end
