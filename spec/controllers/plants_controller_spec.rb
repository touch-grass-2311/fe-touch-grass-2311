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
        get :show, params: { id: '' }
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when plant data is empty' do
      before do
        allow(PlantService).to receive(:get_plant).and_return({ data: nil })
      end
    end

    context 'when plant data is empty' do
      before do
        allow(PlantService).to receive(:get_plant).and_return({ data: nil })
      end

      it 'assigns nil to @plant' do
        get :show, params: { id: 1 }
        expect(assigns(:plant)).to be_nil
      end
    end
  end

  describe 'search' do
    let(:plants_data) do
      [
        {
          id: 1,
          attributes: {
            common_name: 'Rose',
            scientific_name: 'Rosa',
            family: 'Rosaceae',
            family_common_name: 'Rose Family',
            image_url: 'https://example.com/rose.jpg',
            edible: false,
            bloom_months: ['June', 'July'],
            ph_max: 7,
            ph_min: 6,
            light: 'Full Sun',
            min_precipitation: { mm: 500 },
            edible_part: ['Flowers']
          }
        },
        {
          id: 2,
          attributes: {
            common_name: 'Tulip',
            scientific_name: 'Tulipa',
            family: 'Liliaceae',
            family_common_name: 'Lily Family',
            image_url: 'https://example.com/tulip.jpg',
            edible: false,
            bloom_months: ['April', 'May'],
            ph_max: 7.5,
            ph_min: 6.5,
            light: 'Full Sun to Partial Shade',
            min_precipitation: { mm: 400 },
            edible_part: ['Bulb']
          }
        }
      ]
    end

    context 'when plants matching the search query are available' do
      before do
        allow(PlantService).to receive(:search_plants).and_return(data: plants_data)
        get :search, params: { search: 'rose' }
      end

      it 'assigns @plants' do
        expect(assigns(:plants)).to be_present
      end

      it 'assigns only plants with image_url and common_name present' do
        expect(assigns(:plants).all? { |plant| plant.image_url.present? && plant.common_name.present? }).to be_truthy
      end

      it 'sorts plants by common_name in case-insensitive manner' do
        expect(assigns(:plants)).to eq(assigns(:plants).sort_by { |plant| plant.common_name.downcase })
      end
    end

    context 'when no plants matching the search query are available' do
      before do
        allow(PlantService).to receive(:search_plants).and_return(data: [])
        get :search, params: { search: 'nonexistentplant' }
      end

      it 'assigns an empty array to @plants' do
        expect(assigns(:plants)).to eq([])
      end
    end
  end
end
