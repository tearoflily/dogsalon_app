class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :pet
  has_many :menu, through: :booking_menu
end
