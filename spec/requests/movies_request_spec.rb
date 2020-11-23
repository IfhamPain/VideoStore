require 'rails_helper'

RSpec.describe "Movies", type: :request do

  before :all do
    @movie = create(:movie)
    @actor = create(:actor)
    @user = create(:user)
    login(@user)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/movies/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "test" do
      it "returns http success" do
        get new_movie_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template('movies/new')
        post new_movie_path, params: { movie: { title: "Movie Title",
                                                 description: "Movie Description",
                                                 content:  Movie.content[:pg],
                                                 actors: @actor,
                                                 genres:Genre.genre_types[:action]} }
      end.to change(Movie, :count).by(1)
      expect(response).to render_template(movies_path)
    end
    end

  describe "GET /edit" do
    it "test" do
      it "returns http success" do
        title = "EditTitle"
        get edit_movie_path(@movie)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(edit_movie_path(@movie))
        patch new_movie_path, params: { movie: { title: title,
                                                  description: "Movie Description",
                                                  content:  Movie.content[:pg],
                                                  actors: @actor,
                                                  genres:Genre.genre_types[:action]} }
      end.to change(Movie, :count).by(1)
      expect(flash[:success]).to_not be(nil)
      expect(response).to redirect_to(@movie)
      @movie.reload
      expect(title).to eq(@movie.title)
    end
  end

  end