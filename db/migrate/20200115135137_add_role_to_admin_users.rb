class AddRoleToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :role, :integer, null: false, limit: 1, default: 0 if (table_exists? :admin_users)
  end
end
