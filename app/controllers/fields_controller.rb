class FieldsController < ApplicationController
  def index
    if params[:query].present?
      @fields_search = Field.search_by_name_and_address(params[:query])
      @fields = policy_scope(@fields_search)
    else
      @fields = policy_scope(Field)
    end

    @markers = @fields.geocoded.map do |field|
      { lat: field.latitude, lng: field.longitude, info_window_html: render_to_string(partial: "info_window", locals: {field: field})}
    end
  end

  def show
    @field = Field.find(params[:id])
    @booking = Booking.new
    authorize @field
  end

  def new
    @field = Field.new
    authorize @field
  end

  def create
    @field = Field.new(field_params)
    @field.user = current_user
    authorize @field
    if @field.save!
      redirect_to fields_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @field = Field.find(params[:id])
    authorize @field
  end

  def update
    @field = Field.find(params[:id])
    authorize @field
    @field.update(params[:field])
  end

  def destroy
    @field = Field.find(params[:id])
    authorize @field
    @field.destroy
    redirect_to fields_path(@field), status: :see_other
  end

  private

  def field_params
    params.require(:field).permit(:price, :name, :address, :number_of_players, :photo)
  end
end
