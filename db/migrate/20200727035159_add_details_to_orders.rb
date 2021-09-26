class AddDetailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_date, :date
    add_column :orders, :finish_date, :date
    add_column :orders, :deposit, :integer
    add_column :orders, :remainder, :integer
    add_column :orders, :comment, :string
  end
end
