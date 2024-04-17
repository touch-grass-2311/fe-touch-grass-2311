require 'rails_helper'

RSpec.describe Plant do
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

  subject { described_class.new(plant_data) }

  it 'initializes with correct attributes' do
    expect(subject.id).to eq(plant_data[:id])
    expect(subject.common_name).to eq(plant_data[:attributes][:common_name])
    expect(subject.scientific_name).to eq(plant_data[:attributes][:scientific_name])
    expect(subject.family).to eq(plant_data[:attributes][:family])
    expect(subject.family_common_name).to eq(plant_data[:attributes][:family_common_name])
    expect(subject.image_url).to eq(plant_data[:attributes][:image_url])
    expect(subject.edible).to eq(plant_data[:attributes][:edible])
    expect(subject.bloom_months).to eq(plant_data[:attributes][:bloom_months])
    expect(subject.ph_max).to eq(plant_data[:attributes][:ph_max])
    expect(subject.ph_min).to eq(plant_data[:attributes][:ph_min])
    expect(subject.light).to eq(plant_data[:attributes][:light])
    expect(subject.min_precipitation).to eq(plant_data[:attributes][:min_precipitation][:mm])
    expect(subject.edible_part).to eq(plant_data[:attributes][:edible_part])
  end
end
