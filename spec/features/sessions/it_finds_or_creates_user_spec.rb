require "rails_helper"

RSpec.describe "login", type: :feature do
	it "it finds a current user or it creates a new user" do
		client_id = ENV['GITHUB_CLIENT_ID']
		visit "/"

		click_link "Log in with GitHub"

		expect(current_path).to eq("/login/oauth/authorize")
		# expect(current_path).to eq("github.com/login/oauth/authorize?client_id=#{client_id}&scope=user")

	end
end
