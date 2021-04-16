class Pet < ApplicationRecord
  belongs_to :customer
  has_many :bookings
end
