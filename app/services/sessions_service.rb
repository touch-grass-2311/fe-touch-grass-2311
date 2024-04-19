class SessionsService
	def self.find_or_create_user(user_data)
		response = conn.post("/api/v1/users") do |f|
			f.params[:user] = user_data
		end

		JSON.parse(response.body, symbolize_names: true)
	end

	def self.conn
		Faraday.new(url: "https://be-touch-grass-d382a872eaa4.herokuapp.com") do |f|
			f.headers["Content-Type"] = "application/json"
			f.headers["Accept"] = "*/*"
		end
	end
end
