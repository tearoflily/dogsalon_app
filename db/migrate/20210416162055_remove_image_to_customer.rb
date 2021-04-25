class RemoveImageToCustomer < ActiveRecord::Migration[6.0]
  def up
    remove_column :customers, :images, :string
  end

  def down
    add_column :customers, :images, :string
  end
end
