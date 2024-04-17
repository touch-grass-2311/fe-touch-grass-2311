class Plant
  attr_reader :id, :common_name, :scientific_name, :family_common_name, :image_url, :edible,
              :bloom_months, :ph_max, :ph_min, :light, :min_precipitation, :family, :edible_part

  def initialize(data)
    @id = data[:id]
    @common_name = data[:attributes][:common_name]
    @scientific_name = data[:attributes][:scientific_name]
    @family = data[:attributes][:family]
    @family_common_name = data[:attributes][:family_common_name]
    @image_url = data[:attributes][:image_url]
    @edible = data[:attributes][:edible]
    @bloom_months = data[:attributes][:bloom_months].presence || []
    @ph_max = data[:attributes].dig(:ph_max)
    @ph_min = data[:attributes].dig(:ph_min)
    @light = data[:attributes].dig(:light)
    @min_precipitation = data[:attributes].dig(:min_precipitation, :mm)
    @edible_part = data[:attributes].dig(:edible_part).presence || []
  end
end
