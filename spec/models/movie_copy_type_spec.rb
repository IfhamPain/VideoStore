require 'rails_helper'

RSpec.describe MovieCopyType, type: :model do
  before :all do
    @movie_copy_type = create(:movie_copy_type)
  end
  it "Should be valid" do
    expect(@movie_copy_type).to be_valid
  end
  it "copy type should be present" do
    @movie_copy_type.name=""
    expect(@movie_copy_type).to_not be_valid
  end
  it "Copy type should be less than 20 characters" do
    @movie_copy_type.name = 'a' * 21
    expect(@movie_copy_type).to_not be_valid
  end
end