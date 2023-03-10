class BookingsController < ApplicationController
  before_action :set_field, only: %i[new create show]

  def show
    @field = Field.find(params[:field_id])
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.field = @field
    @booking.save!
    redirect_to field_booking_path(@field, @booking.id)
  end

  private

  def set_field
    @field = Field.find(params[:field_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
