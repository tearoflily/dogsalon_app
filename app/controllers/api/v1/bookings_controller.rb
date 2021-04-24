class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  def index

    booking = Booking.joins(:customer, :pet).select("
      bookings.id,
      customers.last_name,
      pets.pet_name,
      bookings.start_date_time,
      bookings.booking_shop_comment
      ")


    render json: booking
  end

  def show
    render json: @booking
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end
end
