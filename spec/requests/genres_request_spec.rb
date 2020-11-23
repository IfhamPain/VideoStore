require 'rails_helper'

RSpec.describe "Genres", type: :request do

  before :all do
    @genre = create(:genre)
    @user = create(:user)
    login(@user)
  end

  describe "GET /index" do
    it "returns http success" do
      get genres_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "test" do
      it "returns http success" do
        get new_genre_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template('genres/new')
        post new_genre_path, params: { genre: { genre: "GenreName" } }
      end.to change(Genre, :count).by(1)
      expect(response).to redirect_to(@genre)
    end
  end

  describe "GET /edit" do
    it "test" do
      it "returns http success" do
        genre = "GenreNameEdit"
        get edit_genre_path(@genre)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(edit_genre_path(@genre))
        patch edit_genre_path, params: { genre: { genre: genre } }
      end.to change(Genre, :count).by(1)
      expect(flash[:success]).to_not be(nil)
      expect(response).to redirect_to(@genre)
      @genre.reload
      expect(genre).to eq(@genre.genre)
    end
  end

end