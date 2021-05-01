class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :pet
  has_many :booking_menus
  has_many :menu, through: :booking_menus
  accepts_nested_attributes_for :booking_menus


end
