class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id]) # Récupérer la ville actuelle
    @gossips = Gossip.joins(user: :city).where(cities: { id: @city.id }) # Récupérer les gossips associés à cette ville
  end
end
