class RemoveMenuIdToBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :menu_id
  end
end
