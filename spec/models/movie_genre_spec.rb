require 'rails_helper'

RSpec.describe MovieGenre, type: :model do
  def setup
    @movie_genre = MovieGenre.new(movie_id: create(:movie).id,
                                  genre_id: create(:genre).id)
  end
  describe 'Movie/Genre test' do
    before { setup }
    it "should be valid" do
      expect(@movie_genre.valid?).to be(true)
    end
    it "should require a movie_id" do
      @movie_genre.movie_id = nil
      expect(@movie_genre.valid?).to_not be(true)
    end
    it "should require a genre_id" do
      @movie_genre.genre_id = nil
      expect(@movie_genre.valid?).to_not be(true)
    end
  end
end
