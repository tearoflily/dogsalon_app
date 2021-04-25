class AddColumnToPet < ActiveRecord::Migration[6.0]
  def up
    add_column :pets, :images, :binary
  end

  def down
  end
end
