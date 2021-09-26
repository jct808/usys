class AddUsernameToAdminUser < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :username, :string if (table_exists? :admin_users)
  end
end
