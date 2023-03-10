class FieldsController < ApplicationController
  def index
    if params[:query].present?
      @fields = Field.search_by_name_and_address(params[:query])
    else
      @fields = Field.all
    end

    @markers = @fields.geocoded.map do |field|
      { lat: field.latitude, lng: field.longitude }
    end
  end

  def show
    @field = Field.find(params[:id])
    @booking = Booking.new
  end

  def new
    @field = Field.new
  end

  def create
    @field = Field.new(field_params)
    @field.user = current_user
    if @field.save!
      redirect_to fields_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @field = Field.find(params[:id])
  end

  def update
    @field = Field.find(params[:id])
    @field.update(params[:field])
  end

  def destroy
    @field = Field.find(params[:id])
    @field.destroy
    redirect_to fields_path(@field), status: :see_other
  end

  private

  def field_params
    params.require(:field).permit(:price, :name, :address, :number_of_players, :photo)
  end
end
