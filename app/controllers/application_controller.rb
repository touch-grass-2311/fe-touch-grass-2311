class ApplicationController < ActionController::Base
	helper_method :current_user

	private
	
	def current_user
		if session[:uid]
			user_data = SessionsService.find_or_create_user(
				uid: session[:uid],
				name: session[:name],
				email: session[:email],
				avatar_url: session[:avatar_url],
				access_token: session[:access_token]
			)
		end
		user_poro(user_data[:data])
	end

	def user_poro(user_data)
		UserPoro.new(id: user_data[:id], attributes: user_data[:attributes])
	end
end
