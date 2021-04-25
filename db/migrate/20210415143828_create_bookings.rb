class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date_time, null: false
      t.datetime :end_date_time, null: false
      t.text :booking_shop_comment
      t.references :customer, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
