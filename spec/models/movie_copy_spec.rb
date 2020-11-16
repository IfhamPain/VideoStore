require 'rails_helper'

RSpec.describe MovieCopy, type: :model do
  before :all do
    @movie_copy = create(:movie_copy)
  end
  it "Should be valid" do
    expect(@movie_copy).to be_valid
  end
  it "Should have a valid movie id" do
    expect(@movie_copy.movie_id).to_not be_nil
  end
  it "Should have a valid barcode" do
    @movie_copy.barcode = nil
    expect(@movie_copy).to_not be_valid
  end
  it "Copy Price cannot be negative" do
    @movie_copy.copy_price = -1
    expect(@movie_copy).to_not be_valid
  end
  it "Stock cannot be negative" do
    @movie_copy.stock = -1
    expect(@movie_copy).to_not be_valid
  end
  it "Price cannot be a string" do
    @movie_copy.copy_price = "aaa"
    expect(@movie_copy).to_not be_valid
  end
  it "Stock cannot be string" do
    @movie_copy.stock = "aaa"
    expect(@movie_copy).to_not be_valid
  end
  it "Given movie should exist in movie table" do
    expect(Movie.find(@movie_copy.movie_id)).to be_valid
  end
  it "MGiven movie type should exist in movie copy type table" do
    expect(MovieCopyType.find(@movie_copy.movie_copy_type_id)).to be_valid
  end
end

