class UserPoro
	attr_accessor :id, :uid, :name, :email, :avatar_url, :access_token, :plants

	def initialize(user_data)
		@id = user_data[:id]
		@uid = user_data[:attributes][:uid]
		@name = user_data[:attributes][:name]
		@email = user_data[:attributes][:email]
		@avatar_url = user_data[:attributes][:avatar_url]
		@access_token = user_data[:attributes][:access_token]
		@plants = parse_plants(user_data[:attributes][:plants])
	end

	def parse_plants(plant_data)
		plant_data.map do |plant|
			eval(plant)
		end
	end
end