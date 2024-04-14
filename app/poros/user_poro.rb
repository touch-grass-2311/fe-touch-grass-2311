class UserPoro
	attr_accessor :uid, :name, :email, :access_token

	def initialize(attributes)
		@uid = attributes[:uid]
		@name = attributes[:name]
		@email = attributes[:email]
		@access_token = attributes[:access_token]
	end
end