class DaleteImageToCustomer < ActiveRecord::Migration[6.0]
  def up
  end

  def down
    remove_column :customers, :images, :string
  end
end
