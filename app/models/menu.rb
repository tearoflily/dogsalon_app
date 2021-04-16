class Menu < ApplicationRecord
  has_many :booking, through: :booking_menu
end
