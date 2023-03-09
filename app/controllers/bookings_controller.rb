class BookingsController < ApplicationController
  before_action :set_field, only: %i[new create]

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.field = @field
    @booking.save
    redirect_to booking_path(@booking.id)
  end

  private

  def set_field
    @field = field.find(params[:field_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
