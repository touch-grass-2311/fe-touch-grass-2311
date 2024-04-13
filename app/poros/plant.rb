class Plant
  attr_reader :id, :common_name, :scientific_name, :family_common_name, :image_url, :edible,
              :bloom_months, :ph_max, :ph_min, :light, :min_precipitation, :family

  def initialize(attributes)
    @id = attributes[:id]
    @common_name = attributes[:common_name]
    @scientific_name = attributes[:scientific_name]
    @family = attributes[:family]
    @family_common_name = attributes[:family_common_name]
    @image_url = attributes[:image_url]
    @edible = attributes[:edible]
    @bloom_months = attributes[:bloom_months].presence || []
    @ph_max = attributes.dig(:ph_max)
    @ph_min = attributes.dig(:ph_min)
    @light = attributes.dig(:light)
    @min_precipitation = attributes.dig(:min_precipitation, :mm)
  end
end
