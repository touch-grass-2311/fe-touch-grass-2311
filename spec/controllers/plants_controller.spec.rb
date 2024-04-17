require 'rails_helper'

RSpec.describe PlantsController, type: :controller do
  describe "GET #index" do
    it "assigns @plants" do
      plant_data = { data: [{ attributes: { name: "Plant 1" } }, { attributes: { name: "Plant 2" } }] }
      allow(PlantService).to receive(:get_all_plants).and_return(plant_data)

      get :index

      expect(assigns(:plants)).to all(be_a(Plant))
      expect(assigns(:plants).map(&:name)).to eq(["Plant 1", "Plant 2"])
    end
  end

  describe "GET #show" do
    it "assigns @plant" do
      plant_data = { data: { attributes: { name: "Plant 1" } } }
      allow(PlantService).to receive(:get_plant).and_return(plant_data)

      get :show, params: { id: 1 }

      expect(assigns(:plant)).to be_a(Plant)
      expect(assigns(:plant).name).to eq("Plant 1")
    end
  end

  describe "GET #search" do
    it "assigns @plants and renders the index template" do
      plant_data = { data: [{ attributes: { name: "Plant 1" } }, { attributes: { name: "Plant 2" } }] }
      allow(PlantService).to receive(:search_plants).and_return(plant_data)

      get :search, params: { q: "search query" }

      expect(assigns(:plants)).to all(be_a(Plant))
      expect(assigns(:plants).map(&:name)).to eq(["Plant 1", "Plant 2"])
      expect(response).to render_template(:index)
    end
  end
end
