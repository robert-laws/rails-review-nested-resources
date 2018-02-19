class CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(id: params[:id])
    if @country.nil?
      redirect_to countries_path, alert: "Country not Found"
    end
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to country_path(@country), notice: "Your country was created successfully"
    else
      render :new
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    @country = Country.find(params[:id])
    if @country.update(country_params)
      redirect_to country_path(@country), notice: "Your country was updated successfully"
    else
      redner :edit
    end
  end

  def destroy
    Country.find(params[:id]).destroy
    redirect_to countries_path
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
