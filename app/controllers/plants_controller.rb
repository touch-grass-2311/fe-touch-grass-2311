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
  end
end
