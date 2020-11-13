require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  def setup
    @actor_movie = ActorMovie.new(actor_id: create(:actor).id,
                      movie_id: create(:movie).id)
  end
  describe 'Actor/Movie test' do
    before { setup }
    it "should be valid" do
      expect(@actor_movie.valid?).to be(true)
    end
    it "should require a actor_id" do
      @actor_movie.actor_id = nil
      expect(@actor_movie.valid?).to_not be(true)
    end
    it "should require a movie_id" do
      @actor_movie.movie_id = nil
      expect(@actor_movie.valid?).to_not be(true)
    end
  end
end

