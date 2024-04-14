class UsersFacade
	def self.find_or_create_user(new_user_data)
		UsersService.register_new_user(new_user_data)
	end
end