class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  def index
    booking = Booking.all
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
