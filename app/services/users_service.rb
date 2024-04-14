class UsersService
	def self.find_or_create_new_user(user_data)
		response = conn.post("/api/v1/users")
		JSON.parse(response.body, symbolize_names: true)
	end

	def self.post_conn 
		Faraday.new(url: "http://localhost:3000") do |f|
			f.headers["Content-Type"] = "application/json"
			f.headers["Accept"] = "*/*"
			f.params[:uid] = user_data[:uid]
			f.params[:email] = user_data[:email]
			f.params[:name] = user_data[:name]
		end
	end
end