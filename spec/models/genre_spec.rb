require 'rails_helper'
RSpec.describe Genre, type: :model do
  before :all do
    @genre = create(:genre)
  end
  it "Model should be valid" do
    expect(@genre).to be_valid
  end
  it "Genre name should be present" do
    @genre.genre=""
    expect(@genre).to_not be_valid
  end
  it "Genre name should be less than 50 characters" do
    @genre.genre="a*51"
    expect(@genre).to_not be_valid
  end
  it "Genre name should be valid" do
    @genre.genre="a*50"
    expect(@genre).to be_valid
  end
end