require "rails_helper"

RSpec.describe "Sessions Service", type: :service do
	describe "class_methods" do 
		describe "#find_or_create_user" do 
			it "can get the info of anyone who registered for the app" do
				# TODO add plants to user_data when function to search plants array on user
				  # is defined on FE
				user = {
					uid: "23423423",
					name: "OJ Simpson",
					email: "thejuiceisloose@ididit.com",
					avatar_url: "https://avatars.githubusercontent.com/me_in_ski_mask",
					access_token: "aASlk3234ES243ljjio32io"
				}
				response_hash = SessionsService.find_or_create_user(user)

				expect(response_hash[:data][:type]).to eq("user")
				expect(response_hash[:data][:attributes][:uid]).to eq("23423423")
				expect(response_hash[:data][:attributes][:name]).to eq("OJ Simpson")
				expect(response_hash[:data][:attributes][:email]).to eq("thejuiceisloose@ididit.com")
				expect(response_hash[:data][:attributes][:avatar_url]).to eq("https://avatars.githubusercontent.com/me_in_ski_mask")
				expect(response_hash[:data][:attributes][:access_token]).to eq("aASlk3234ES243ljjio32io")
			end
		end
	end
end