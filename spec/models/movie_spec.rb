require 'rails_helper'
RSpec.describe Movie, type: :model do
  before :all do
    @movie = create(:movie)
  end
  it "Model should be valid" do
    expect(@movie).to be_valid
  end
  it "Title should be present" do
    @movie.title=""
    expect(@movie).to_not be_valid
  end
  it "Title should be less than 50 characters" do
    @movie.title="a*51"
    expect(@movie).to_not be_valid
  end
  it "Title should be valid" do
    @movie.title="a*50"
    expect(@movie).to be_valid
  end
  it "Description should be present" do
    @movie.description=""
    expect(@movie).to_not be_valid
  end
  it "Genres should be present" do
    @movie.genre=""
    expect(@movie).to_not be_valid
  end
  it "Content should be present" do
    @movie.content=""
    expect(@movie).to_not be_valid
  end
  it "Actors should be present" do
    @movie.actors=""
    expect(@movie).to_not be_valid
  end
  describe "Search using TSVector" do
    it "Search by valid title" do
      search_param = "Logan"
      expect(@movie).to eq(Movie.search(search_param)[0])
    end
    it "Search by invalid title" do
      search_param = "Potato"
      expect(Movie.search(search_param)).to be(nil)
    end
    it "Search by description - keyword 1" do
      search_param = "story"
      expect(@movie).to eq(Movie.search(search_param)[0])
    end
    it "Search by description - keyword 2" do
      search_param = "logan"
      expect(@movie).to eq(Movie.search(search_param)[0])
    end
    it "Search by description - keyword 3" do
      search_param = "wolverine"
      expect(@movie).to eq(Movie.search(search_param)[0])
    end
  end
end