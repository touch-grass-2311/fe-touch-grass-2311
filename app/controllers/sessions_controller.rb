class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		user_info = request.env["omniauth.auth"]

		require 'pry'; binding.pry
		# session[:user_id] = user_info.id
	end
end