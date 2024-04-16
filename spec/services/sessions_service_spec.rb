require "rails_helper"

RSpec.describe "Sessions Service", type: :service do
	describe "class_methods" do 
		describe "#find_or_create_user" do 
			it "can get the info of anyone who registered for the app" do
				# TODO add plants to user_data when function to search plants array on user
				  # is defined on FE
				user_data = {
					uid: "23423423",
					name: "Matt Darlington",
					email: "mdarl17@gmail.com",
					avatar_url: "https://avatars.githubusercontent.com/u/13741144?v=4",
					access_token: "aASlk3234ES243ljjio32io"
				}
				response_hash = SessionsService.find_or_create_user(user_data)

				expect(response_hash[:data][:type]).to eq("user")
				expect(response_hash[:data][:attributes][:uid]).to eq("23423423")
				expect(response_hash[:data][:attributes][:name]).to eq("Matt Darlington")
				expect(response_hash[:data][:attributes][:email]).to eq("mdarl17@gmail.com")
				expect(response_hash[:data][:attributes][:avatar_url]).to eq("https://avatars.githubusercontent.com/u/13741144?v=4")
				expect(response_hash[:data][:attributes][:access_token]).to eq("aASlk3234ES243ljjio32io")
			end
		end
	end
end