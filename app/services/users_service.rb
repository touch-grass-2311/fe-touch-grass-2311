class UsersService
	def self.get_all_users
		response = conn.get("/api/v1/users")
		JSON.parse(response.body, symbolize_names: true)
	end

	def self.get_one_user(uid)
		response = conn.get("/api/v1/users/#{uid}")
		JSON.parse(response.body, symbolize_names: true)
	end
	
	def self.register_new_user(user_data)
		conn = Faraday.new(url: "http://localhost:3000") do |f|
			f.headers["Content-Type"] = "application/json"
			f.headers["Accept"] = "*/*"
			f.params[:uid] = user_data[:uid]
			f.params[:email] = user_data[:email]
			f.params[:name] = user_data[:name]
		end
		
		response = conn.post("/api/v1/users")

		JSON.parse(response.body, symbolize_names: true)
	end

	def self.conn
		Faraday.new(url: "http://localhost:3000") do |f|
			f.headers["Content-Type"] = "application/json"
			f.headers["Accept"] = "application/json"
		end
	end
end