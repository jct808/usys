class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :phone
      t.string :fax
      t.string :address
      t.string :sales
      t.integer :status

      t.timestamps
    end
  end
end
