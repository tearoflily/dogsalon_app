class CreateBookingMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_menus do |t|
      t.references :booking, null: false, index: true, foreign_key: true
      t.references :menu, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
