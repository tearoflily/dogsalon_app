class AddColumnLastbookingToBookings < ActiveRecord::Migration[6.0]
  def up
    add_column :bookings, :start_last_booking, :datetime
    add_column :bookings, :end_last_booking, :datetime
  end

  def down
  end
end
