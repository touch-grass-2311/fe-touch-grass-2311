require 'rails_helper'
require 'webmock/rspec'

RSpec.describe PlantService do
  describe ".get_all_plants" do
    it "makes a GET request to the API and returns the response" do
      plant_data = { data: [{ attributes: { name: "Plant 1" } }, { attributes: { name: "Plant 2" } }] }
      stub_request(:get, "#{PlantService::BACKEND_URL}/plants").to_return(body: plant_data.to_json)

      response = PlantService.get_all_plants

      expect(response).to eq(plant_data)
    end
  end

  describe ".get_plant" do
    it "makes a GET request to the API with the plant ID and returns the response" do
      plant_data = { data: { attributes: { name: "Plant 1" } } }
      stub_request(:get, "#{PlantService::BACKEND_URL}/plants/1").to_return(body: plant_data.to_json)

      response = PlantService.get_plant(1)

      expect(response).to eq(plant_data)
    end
  end

  describe ".search_plants" do
    it "makes a GET request to the API with the search query and returns the response" do
      plant_data = { data: [{ attributes: { name: "Plant 1" } }, { attributes: { name: "Plant 2" } }] }
      stub_request(:get, "#{PlantService::BACKEND_URL}/search")
        .with(query: { q: "search query" })
        .to_return(body: plant_data.to_json)

      response = PlantService.search_plants("search query")

      expect(response).to eq(plant_data)
    end
  end
end
