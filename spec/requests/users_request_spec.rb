require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    it "returns http success" do
      get "/users/index"
      expect(response).to have_http_status(:success)
    end
    it 'requires users page' do
      get ("/admin/users")
      expect(response).to have_http_status(200)
    end
    it 'requires users page' do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
    it 'requires users page' do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end
end
