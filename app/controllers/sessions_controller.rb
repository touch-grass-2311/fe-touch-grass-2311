class SessionsController < ApplicationController
	def create
		client_id = ENV["GITHUB_CLIENT_ID"]
 		client_secret = ENV["GITHUB_CLIENT_SECRET"]
		code = params[:code]
		# move to services/facade
		conn = Faraday.new(url: "https://github.com", headers: {"Accept": "application/json"})
		response = conn.post("/login/oauth/access_token") do |req|
			req.params = {
				"code": code,
				"client_id": client_id,
				"client_secret": client_secret
			}
		end

		parsed = JSON.parse(response.body, symbolize_names: true) 
		
		access_token = parsed[:access_token]

		conn = Faraday.new(
			url: "https://api.github.com",
			headers: {
				"Authorization": "token #{access_token}"
			}
		)
		response = conn.get("/user")
		
		user = JSON.parse(response.body, symbolize_names: true)
		
		if user[:data] != nil
			session[:user_id] = user[:id]
			redirect_to dashboard_path
		else
			# Error: Could not find Github account
		end
	end
end