require 'rails_helper'

RSpec.describe "Actors", type: :request do

  before :all do
    @actor = create(:actor)
    @user = create(:user)
    login(@user)
  end

  describe "GET /index" do
    it "returns http success" do
      get actors_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "test" do
      it "returns http success" do
        get new_actor_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template('actors/new')
        post new_actor_path, params: { actor: { name: " ActorName",
                                                date_of_birth: Date.parse('1972-11-11')
        } }
      end.to change(Actor, :count).by(1)
      expect(response).to redirect_to(@actor)
    end
  end

  describe "GET /edit" do
    it "test" do
      it "returns http success" do
        name = "ActorNameEdit"
        get edit_actor_path(@actor)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(edit_actor_path(@actor))
        patch edit_actor_path, params: { actor: { name: " ActorNameEdit",
                                                  date_of_birth: Date.parse('1974-11-11')
        } }
      end.to change(Actor, :count).by(1)
      expect(flash[:success]).to_not be(nil)
      expect(response).to redirect_to(@actor)
      @actor.reload
      expect(name).to eq(@actor.name)
    end
  end
end