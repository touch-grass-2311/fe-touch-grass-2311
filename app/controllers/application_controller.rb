class ApplicationController < ActionController::Base
	helper_method :current_user

	private
	
	def current_user
		if cookies.encrypted[:uid]
			user_data = SessionsService.find_or_create_user(
				uid: cookies.encrypted[:uid],
				name: cookies.encrypted[:name],
				email: cookies.encrypted[:email],
				avatar_url: cookies.encrypted[:avatar_url],
				access_token: cookies.encrypted[:access_token]
			)
		end
		user_poro(user_data[:data])
	end

	def user_poro(user_data)
		UserPoro.new(id: user_data[:id], attributes: user_data[:attributes])
	end
end
