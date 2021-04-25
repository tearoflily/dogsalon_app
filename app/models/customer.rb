class Customer < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one :enquete, dependent: :destroy
end
