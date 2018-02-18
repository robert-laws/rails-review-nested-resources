class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
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
