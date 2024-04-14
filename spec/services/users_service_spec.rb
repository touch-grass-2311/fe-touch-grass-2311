require "rails_helper"

RSpec.describe "Users Service", type: :service do
	it "can get the info of anyone who registered for the app" do
		user_uid = "13741144"
		res = UsersService.find_or_register_user[:user_uid]
	end
end