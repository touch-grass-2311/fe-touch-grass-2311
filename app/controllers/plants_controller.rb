class PlantsController < ApplicationController

  def index
    response = PlantService.get_all_plants
    @plants = response[:data].map { |plant_data| Plant.new(plant_data[:attributes]) }
  end

  def show
    response = PlantService.get_plant(params[:id])
    if response.present? && response[:data].present?
      @plant = Plant.new(response[:data][:attributes])
    else
      render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end
  end

  def search
    response = PlantService.search_plants(params[:q])
    @plants = response[:data].map { |plant_data| Plant.new(plant_data[:attributes]) }
    render :index
  end

end
