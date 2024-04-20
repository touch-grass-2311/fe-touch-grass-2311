require "rails_helper"

RSpec.describe "login", type: :feature do 
	before(:each) do 
		user = {
			uid: "23423423",
			name: "OJ Simpson",
			email: "thejuiceisloose@ididit.com",
			avatar_url: "https://avatars.githubusercontent.com/white_ford_bronco",
			access_token: "aASlk3234ES243ljjio32io"
		}
	end

	it "it finds a current user or it creates a new user" do
		
		client_id = ENV['GITHUB_CLIENT_ID']
		visit "/"

		click_link "Log in with GitHub"

		expect(current_path).to eq("/login/oauth/authorize")

	end
end 