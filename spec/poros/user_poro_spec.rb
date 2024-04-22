require "rails_helper"

RSpec.describe "User" do 
	it "exists" do
		attrs = {
			id: 1,
			attributes: {
			name: "Matt Darlington",
			uid: "17747321",
			email: "mdarl17@gmail.com",
			avatar_url: "my_avatar_url.com",
			access_token: "3342hjkash32jh332lkj2h423",
			plants: [{
				common_name: "Evergreen Oak",
				scientific_name: "Auroris Borealis",
				family_common_name: "Family Stone",
				image_url: "beautiful_oak_tree_image.com",
				synonyms: "Oak, Oakwood, Okie, Greeny",
				edible: "Not gonna kill you, but that's a pretty low bar."
			}
			]
			}
		}
	user = UserPoro.new(attrs)

	expect(user).to be_a(UserPoro)
	expect(user.id).to eq(1)
	expect(user.uid).to eq("17747321")
	expect(user.name).to eq("Matt Darlington")
	expect(user.email).to eq("mdarl17@gmail.com")
	expect(user.avatar_url).to eq("my_avatar_url.com")
	expect(user.access_token).to eq("3342hjkash32jh332lkj2h423")
	expect(user.plants).to match_array([{
		common_name: "Evergreen Oak",
		scientific_name: "Auroris Borealis",
		family_common_name: "Family Stone",
		image_url: "beautiful_oak_tree_image.com",
		synonyms: "Oak, Oakwood, Okie, Greeny",
		edible: "Not gonna kill you, but that's a pretty low bar."
	}])
	end
end 