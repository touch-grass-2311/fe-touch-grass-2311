require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index; render plain: "Welcome to our garden!"; end
  end

  describe "#current_user" do
    context "when user is logged in" do
      let(:user_data) {
        {
          id: 1,
          attributes: {
            uid: 123,
            name: "Obama",
            email: "obama@44.com",
            avatar_url: "http://example.com/avatar",
            access_token: "secret"
          }
        }
      }

      before do
        session[:user_id] = 1
        cookies.encrypted[:uid] = 123
        cookies.encrypted[:name] = "Obama"
        cookies.encrypted[:email] = "obama@44.com"
        cookies.encrypted[:avatar_url] = "http://example.com/avatar"
        cookies.encrypted[:access_token] = "secret"
        allow(SessionsService).to receive(:find_or_create_user).and_return(data: user_data)
      end

      it "returns a user object" do
        cookies.encrypted[:uid] = 123
        cookies.encrypted[:name] = "Obama"
        cookies.encrypted[:email] = "obama@44.com"
      end
    end

    context "when no user is logged in" do
      it "returns nil" do
        cookies.encrypted[:uid] = nil
        expect(controller.send(:current_user)).to be_nil
      end
    end
  end

  describe "#user_poro" do
    let(:user_data) {
      {id: 1, attributes: {name: "Barack Obama", email: "obama@44.com"}}
    }

    it "returns a UserPoro object" do
      user = controller.send(:user_poro, user_data)
      expect(user).to be_a(UserPoro)
      expect(user.id).to eq(1)
      expect(user.name).to eq("Barack Obama")
    end
  end
end
