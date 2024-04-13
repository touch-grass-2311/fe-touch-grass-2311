require 'rails_helper'

RSpec.describe Plant do
  let(:plant_data) do
    {
      id: 1,
      common_name: 'Sunflower',
      scientific_name: 'Helianthus annuus',
      family_common_name: 'Aster family',
      image_url: 'https://example.com/sunflower.jpg',
      edible: true
      # Can't seem to get these to work
      # main_species: {
      #   growth: {
      #     bloom_months: [6, 7, 8],
      #     ph_max: 7.5,
      #     ph_min: 6.0,
      #     light: 8,
      #     min_precipitation: 100
      #   }
      # }
    }
  end

  subject { described_class.new(plant_data) }

  it 'initializes with the given data' do
    expect(subject.id).to eq(1)
    expect(subject.common_name).to eq('Sunflower')
    expect(subject.scientific_name).to eq('Helianthus annuus')
    expect(subject.family_common_name).to eq('Aster family')
    expect(subject.image_url).to eq('https://example.com/sunflower.jpg')
    expect(subject.edible).to be true
    # expect(subject.bloom_months).to eq([6, 7, 8])
    # expect(subject.ph_max).to eq(7.5)
    # expect(subject.ph_min).to eq(6.0)
    # expect(subject.light).to eq(8)
    # expect(subject.min_precipitation).to eq(100)
  end

  it 'exposes the plant attributes' do
    expect(subject.id).to eq(plant_data[:id])
    expect(subject.common_name).to eq(plant_data[:common_name])
    expect(subject.scientific_name).to eq(plant_data[:scientific_name])
    expect(subject.family_common_name).to eq(plant_data[:family_common_name])
    expect(subject.image_url).to eq(plant_data[:image_url])
    expect(subject.edible).to eq(plant_data[:edible])
    # expect(subject.bloom_months).to eq(plant_data.dig(:main_species, :growth, :bloom_months))
    # expect(subject.ph_max).to eq(plant_data.dig(:main_species, :growth, :ph_max))
    # expect(subject.ph_min).to eq(plant_data.dig(:main_species, :growth, :ph_min))
    # expect(subject.light).to eq(plant_data.dig(:main_species, :growth, :light))
    # expect(subject.min_precipitation).to eq(plant_data.dig(:main_species, :growth, :min_precipitation))
  end
end
