class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :menu_name, null: false
      t.integer :breed, null: false
      t.integer :price, null: false
      t.time :working_hours, null: false

      t.timestamps
    end
  end
end
