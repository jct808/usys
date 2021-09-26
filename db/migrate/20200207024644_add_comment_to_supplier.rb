class AddCommentToSupplier < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :comment, :string
  end
end
