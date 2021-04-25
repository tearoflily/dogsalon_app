class Pet < ApplicationRecord
  belongs_to :customer
  has_many :bookings
  enum gender: {オス: 1, メス:2}
end
