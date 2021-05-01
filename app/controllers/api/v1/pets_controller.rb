class Api::V1::PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index

    pets = Pet.all
    render json: pets, include: [:customer, :bookings]
  end

  def show
    render json: @pet, include: [:customer, :bookings]
  end

  def new
  end

  def create
  end

  def update
  end

  def destory
  end


  private
    def set_pet
      @pet = Pet.find(params[:id])
    end
end