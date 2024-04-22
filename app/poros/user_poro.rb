class UserPoro
	attr_accessor :id, :uid, :name, :email, :avatar_url, :access_token, :plants

	def initialize(user_data)
		@id = user_data&.dig(:id)
		@uid = user_data&.dig(:attributes, :uid)
		@name = user_data&.dig(:attributes, :name)
		@email = user_data&.dig(:attributes, :email)
		@avatar_url = user_data&.dig(:attributes, :avatar_url)
		@access_token = user_data&.dig(:attributes, :access_token)
		@plants = user_data&.dig(:attributes, :plants)
	end

	def parse_plants(plant_data)
		if plant_data
			plant_data.map do |plant|
				eval(plant)
			end
		else
			nil
		end
	end
end