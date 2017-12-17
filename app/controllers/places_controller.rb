 class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.where(nil) # creates an anonymous scope
    @places = @places.location(params[:location]) if params[:location].present?
    @places = @places.min_price(params[:min_price]) if params[:min_price].present?
    @places = @places.max_price(params[:max_price]) if params[:max_price].present?
    @places = @places.min_exposure(params[:min_exposure]) if params[:min_exposure].present?
    @places = @places.max_exposure(params[:max_exposure]) if params[:max_exposure].present?
    @places = @places.category(params[:category]) if params[:category].present?
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @booking = Booking.new
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
    if @place.user_id != current_user.id
      flash[:alert] = "You can only edit your own sets #nicetry"
      redirect_to place
    end
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id

    if params['place']['photo']
      params['place']['photo']['image'].each do |image|
        @place.photos.build(image: image)
      end
    end
    if params['place']['tag']
      tags = params['place']['tag']['name'].split(', ')
      tags.each do |tag|
        @place.tags.build(name: tag)
      end
    end

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:user_id, :photo_id, :name, :description, :area, :category, :address, :exposure, :price, :photo, photo_attributes: [:image], tag_attributes: [:name])
    end
end
