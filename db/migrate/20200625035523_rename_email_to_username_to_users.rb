class RenameEmailToUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    if column_exists? :users, :email
     rename_column :users, :email, :username
    end 
   #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
