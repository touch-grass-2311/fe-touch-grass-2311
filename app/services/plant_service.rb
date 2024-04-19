class PlantService
  BACKEND_URL = 'https://be-touch-grass-d382a872eaa4.herokuapp.com/api/v1'

  def self.get_all_plants
    response = Faraday.get("#{BACKEND_URL}/plants")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_plant(id)
    response = Faraday.get("#{BACKEND_URL}/plants/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_plants(query, page = 1, limit = 20)
    url = "#{BACKEND_URL}/search"
    params = { q: query, page: page, limit: limit }
    response = Faraday.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
