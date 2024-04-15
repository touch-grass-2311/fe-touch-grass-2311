class SessionsService
	def self.find_or_create_user(user_data)
		response = conn.post("/api/v1/users") do |f|
			f.params[:uid] = user_data[:uid]
			f.params[:name] = user_data[:name]
			f.params[:email] = user_data[:email]
			f.params[:access_token] = user_data[:access_token]
		end
		JSON.parse(response.body, symbolize_names: true)
	end

	def self.conn
		Faraday.new(url: "http://localhost:3000") do |f|
			f.headers["Content-Type"] = "application/json"
			f.headers["Accept"] = "*/*"
		end
	end
end