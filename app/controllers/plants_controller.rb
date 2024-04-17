class PlantsController < ApplicationController

  def index
    response = PlantService.get_all_plants
    @plants = response[:data].map { |plant| Plant.new(plant) }
  end

  def show
    response = PlantService.get_plant(params[:id])
    if response.present? && response[:data].present?
      @plant = Plant.new(response[:data])

    else
      render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end
  end

  def search
    query = params[:search]
    response = PlantService.search_plants(query)
    if response.present? && response[:data].present?
      @plants = response[:data].map { |plant| Plant.new(plant) }
    else
      @plants = [] # Empty array if no plants found
    end
  end
end
