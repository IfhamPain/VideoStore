require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /home" do
    before { get  root_path} #First visit root_path before executing 2 tests below
    it 'requires root page' do
      expect(response).to have_http_status(200)
    end
  end
end
