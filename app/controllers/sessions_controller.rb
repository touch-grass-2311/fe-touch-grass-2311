class SessionsController < ApplicationController
	def create
		client_id = ENV["GITHUB_CLIENT_ID"]
 		client_secret = ENV["GITHUB_CLIENT_SECRET"]
		code = params[:code]
		conn = Faraday.new(url: "https://github.com", headers: {"Accept": "application/json"})
		response = conn.post("/login/oauth/access_token") do |req|
			req.params = {
				"code": code,
				"client_id": client_id,
				"client_secret": client_secret
			}
		end

		data = JSON.parse(response.body, symbolize_names: true) 
		access_token = data[:access_token]

		conn = Faraday.new(
			url: "https://api.github.com",
			headers: {
				"Authorization": "token #{access_token}"
			}
		)
		response = conn.get("/user")
		
		user = JSON.parse(response.body, symbolize_names: true)

		session[:uid] = user[:id]
		session[:name] = user[:name]
		session[:email] = user[:email]
		session[:avatar_url] = user[:avatar_url]
		session[:access_token] = access_token
		
		redirect_to dashboard_show_path(user[:id])
	end
end