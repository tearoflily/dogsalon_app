class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  def index
    search_ransack = Customer.ransack(search_params)
    customer = search_ransack.result.pluck(:id)
    customer_data = Booking.where(customer_id: customer)
    @bookings = customer_data.includes(:customer, :pet, :menu)
    @booking_count = @bookings.count.to_i
    render :formats => :json and return
  end

  def new
    
  end

  def create
    
  end


  def show
    render json: @booking
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def search_params
      params.require(:q).permit(:last_name_eq, :mobilephone_eq)
    end
end
