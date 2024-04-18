class UserPoro
	attr_accessor :id, :uid, :name, :email, :avatar_url, :access_token, :plants

	def initialize(user_data)
		cookies.encrypted[:user_id] = user_data[:id]
		user_id = cookies.encrypted[:user_id]
		cookies.encrypted[:uid] = user_data[:attributes][:uid]
		uid = cookies.encrypted[:uid]
		cookies.encrypted[:name] = user_data[:attributes][:name]
		name = cookies.encrypted[:name]
		cookies.encrypted[:email] = user_data[:attributes][:email]
		email = cookies.encrypted[:email] 
		cookies.encrypted[:avatar_url] = user_data[:attributes][:avatar_url]
		avatar_url = cookies.encrypted[:avatar_url]
		cookies.encrypted[:access_token] = user_data[:attributes][:access_token]
		access_token = cookies.encrypted[:access_token]
		cookies.encrypted[:plants] = user_data[:attributes][:plant]
		plants = cookies.encrypted[:plants]

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