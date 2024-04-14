require "rails_helper"

RSpec.describe "login", type: :feature do 
	it "it finds a current user or it creates a new user" do 
		visit "/"

		click_link "Log in with Github"

		expect(current_path).to eq("github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_CLIENT_ID']}&scope=repo")
	end
end 