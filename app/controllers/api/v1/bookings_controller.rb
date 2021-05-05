class Api::V1::BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  def index
    # 1.ペット情報でも検索できるようにする。フォームに追加する。
    # 2.検索フォーム日付欄、犬種欄
    # 3.入力フォームのリセットボタンを作る
    # 4.細部デザインをモックに近づける
    # 5.一覧は予約日時基準でソート。今日から未来。
    # 6.予約日時などの記載を修正する
    # 7.「全て表示」「一週間前まで」「昨日」「今日」「明日」「一週間後まで」で今表示中のデータをフィルター

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

  def oneday

    # one_date = params[:date].to_datetime
    one_date_bookings = Booking.where(start_date_time: one_date.beginning_of_day..one_date.end_of_day)
    @bookings = one_date_bookings.includes(:customer, :pet, :menu)
    render json: @bookings
  end

  def month

    @bookings = Booking.includes(:customer, :pet, :menu)
    @booking_count = @bookings.count.to_i
    render :formats => :json and return
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def search_params
      params.require(:q).permit(:last_name_eq, :mobilephone_eq)
    end
end
