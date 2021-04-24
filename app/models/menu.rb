class Menu < ApplicationRecord
  has_many :bookings, through: :booking_menus
  has_many :booking_menus
end
