class Plant
  attr_reader :id, :common_name, :scientific_name, :family_common_name, :image_url, :edible,
              :bloom_months, :ph_max, :ph_min, :light, :min_precipitation

  def initialize(attributes)
    @id = attributes[:id]
    @common_name = attributes[:common_name]
    @scientific_name = attributes[:scientific_name]
    @family_common_name = attributes[:family_common_name]
    @image_url = attributes[:image_url]
    @edible = attributes[:edible]
    @bloom_months = attributes.dig(:main_species, :growth, :bloom_months) || []
    @ph_max = attributes.dig(:main_species, :growth, :ph_max)
    @ph_min = attributes.dig(:main_species, :growth, :ph_min)
    @light = attributes.dig(:main_species, :growth, :light)
    @min_precipitation = attributes.dig(:main_species, :growth, :min_precipitation)
  end
end
