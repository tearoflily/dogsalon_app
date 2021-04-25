class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  def index
    @bookings = Booking.joins(:customer, :pet, :menu).all
    render :formats => :json
  end


  def show
    render json: @booking
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end
end
