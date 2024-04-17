class PlantService
  BACKEND_URL = 'http://localhost:3000/api/v1'

  def self.get_all_plants
    response = Faraday.get("#{BACKEND_URL}/plants")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_plant(id)
    response = Faraday.get("#{BACKEND_URL}/plants/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_plants(query)
    response = Faraday.get("#{BACKEND_URL}/search", { q: query })
    JSON.parse(response.body, symbolize_names: true)
  end
end
