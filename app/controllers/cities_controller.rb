class CitiesController < ApplicationController
  def index
    if params[:country_id]
      @country = Country.find_by(id: params[:country_id])
      if @country.nil?
        redirect_to cities_path, alert: "Country not Found"
      else
        @cities = @country.cities
      end
    else
      @cities = City.all
    end
  end

  def show
    if params[:country_id]
      @country = Country.find_by(id: params[:country_id])
      @city = @country.cities.find_by(id: params[:id])
      if @city.nil?
        redirect_to country_cities_path(@country), alert: "City not found"
      end
    else
      @city = City.find(params[:id])
    end
  end

  def new
    @city = City.new
    @countries = Country.all
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to city_path(@city), notice: "Your city was created successfully"
    else
      render :new
    end
  end

  def edit
    @city = City.find(params[:id])
    @countries = Country.all
  end

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      redirect_to city_path(@city), notice: "Your city was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    City.find(params[:id]).destroy
    redirect_to cities_path
  end

  private

  def city_params
    params.require(:city).permit(:name, :country_id)
  end
end
