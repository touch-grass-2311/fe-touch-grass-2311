require 'rails_helper'

RSpec.describe PlantsController, type: :controller do
  describe 'show' do
    let(:plant_data) do
      {
        id: 1,
        attributes: {
          common_name: 'Tomato',
          scientific_name: 'Solanum lycopersicum',
          family: 'Solanaceae',
          family_common_name: 'Nightshade',
          image_url: 'https://example.com/tomato.jpg',
          edible: true,
          bloom_months: ['May', 'June'],
          ph_max: 7.5,
          ph_min: 6.0,
          light: 'Full Sun',
          min_precipitation: { mm: 500 },
          edible_part: ['Fruit']
        }
      }
    end

    context 'when plant data is available' do
      before do
        allow(PlantService).to receive(:get_plant).and_return({ data: plant_data })
      end

      it 'assigns @plant' do
        get :show, params: { id: plant_data[:id] }
        expect(assigns(:plant)).to be_a(Plant)
        expect(assigns(:plant).common_name).to eq(plant_data[:attributes][:common_name])
        expect(assigns(:plant).scientific_name).to eq(plant_data[:attributes][:scientific_name])
        expect(assigns(:plant).family).to eq(plant_data[:attributes][:family])
        expect(assigns(:plant).family_common_name).to eq(plant_data[:attributes][:family_common_name])
        expect(assigns(:plant).image_url).to eq(plant_data[:attributes][:image_url])
        expect(assigns(:plant).edible).to eq(plant_data[:attributes][:edible])
        expect(assigns(:plant).bloom_months).to eq(plant_data[:attributes][:bloom_months])
        expect(assigns(:plant).ph_max).to eq(plant_data[:attributes][:ph_max])
        expect(assigns(:plant).ph_min).to eq(plant_data[:attributes][:ph_min])
        expect(assigns(:plant).light).to eq(plant_data[:attributes][:light])
        expect(assigns(:plant).min_precipitation).to eq(plant_data[:attributes][:min_precipitation][:mm])
        expect(assigns(:plant).edible_part).to eq(plant_data[:attributes][:edible_part])
      end

      it 'renders the show template' do
        get :show, params: { id: plant_data[:id] }
        expect(response).to render_template(:show)
      end
    end

    context 'when plant data is not available' do
      before do
        allow(PlantService).to receive(:get_plant).and_return(nil)
      end

      it 'renders 404 page' do
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:not_found)
        expect(response).to render_template(file: Rails.public_path.join('404.html'))
      end
    end

    context 'when plant data is empty' do
      before do
        allow(PlantService).to receive(:get_plant).and_return({ data: nil })
      end

      it 'renders 404 page' do
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:not_found)
        expect(response).to render_template(file: Rails.public_path.join('404.html'))
      end
    end
  end
end
