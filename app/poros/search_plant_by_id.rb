# Might not use

class SearchPlantById
  attr_reader :common_name,
              :synonyms,
              :family_common_name,
              :scientific_name,
              :image_url,
              :edible,
              :bloom_months,
              :ph_max,
              :ph_min,
              :light,
              :min_precipitation,
              :edible_part

  def initialize(data)
    @common_name = data[:common_name]
    @synonyms = data[:synonyms]
    @family_common_name = data[:family_common_name]
    @scientific_name = data[:scientific_name]
    @image_url = data[:image_url]
    @edible = data[:edible]
    @bloom_months = data[:main_species][:growth][:bloom_months]
    @ph_max = data[:main_species][:growth][:ph_max]
    @ph_min = data[:main_species][:growth][:ph_min]
    @light = data[:main_species][:growth][:light]
    @min_precipitation = data[:main_species][:growth][:min_precipitation]
    @edible_part = data[:main_species][:edible_part]
  end
end
