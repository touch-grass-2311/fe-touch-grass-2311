require 'rails_helper'

RSpec.describe 'Plant Show Page', type: :feature do
  include PlantsHelper

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
        bloom_months: ['May', 'Jun'],
        ph_max: 7.5,
        ph_min: 6.0,
        light: 'Full Sun',
        min_precipitation: { mm: 500 },
        edible_part: ['Fruit']
      }
    }
  end

  before do
    allow(PlantService).to receive(:get_plant).and_return({ data: plant_data })
  end

  it 'displays plant details' do
    visit plant_path(plant_data[:id])

    expect(page).to have_content(plant_data[:attributes][:common_name])
    expect(page).to have_content(plant_data[:attributes][:scientific_name].titleize)

    if plant_data[:attributes][:family_common_name].present?
      expect(page).to have_content(plant_data[:attributes][:family_common_name])
    else
      expect(page).to have_content(plant_data[:attributes][:family])
    end

    expect(page).to have_css("img[src='#{plant_data[:attributes][:image_url]}']")

    edible_text = display_edible(plant_data[:attributes][:edible])
    expect(page).to have_content(edible_text)

    bloom_months_text = display_or_not_available(plant_data[:attributes][:bloom_months])
    expect(page).to have_content(bloom_months_text)

    ph_range_text = display_ph_range(plant_data[:attributes][:ph_min], plant_data[:attributes][:ph_max])
    expect(page).to have_content(ph_range_text)

    light_text = display_light(plant_data[:attributes][:light])
    expect(page).to have_content(light_text)

    precipitation_text = display_precipitation(plant_data[:attributes][:min_precipitation][:mm])
    expect(page).to have_content(precipitation_text)

    edible_part_text = display_edible_part(plant_data[:attributes][:edible_part])
    expect(page).to have_content(edible_part_text)
  end
end
