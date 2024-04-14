require "rails_helper"

RSpec.describe "Users Facade", type: :facade do
	before(:each) do 
		users = FactoryBot.create_list(:user, 19)

		users.each do |user|
			UsersFacade.register_new_user(user)
		end

		sesh_user = ({
			name: "Matt Darlington", 
			email: "mdarl17@gmail.com", 
			uid: "13741144"
		})
		UsersFacade.register_new_user(sesh_user)
	end

	describe "class methods" do 
		describe ".find_or_create_user" do 
			it "returns a registered user or creates a new Touch Grass user given their Github ID" do
				expect(UsersFacade.find_or_create_user("13741144"))
			end
		end
	end
end 