class PlantsController < ApplicationController

  def index
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
    page = (params[:page].presence || 1).to_i
    limit = (params[:limit].presence || 20).to_i

    response = PlantService.search_plants(query, page, limit)

    if response[:data].present?
      @plants = response[:data].map { |plant| Plant.new(plant) }
      @plants.select! { |plant| plant.image_url.present? && plant.common_name.present? }
      @plants.sort_by! { |plant| plant.common_name.downcase }
    else
      @plants = []
    end
  end

end
