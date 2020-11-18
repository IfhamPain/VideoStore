require 'rails_helper'

RSpec.describe MovieCopyOrder, type: :model do
  before :all do
    @movie_copy_order = create(:movie_copy_order)
  end
  describe 'Model should be valid' do
    it "should be valid" do
      expect(@movie_copy_order).to be_valid
    end
    it "should require a order_id" do
      @movie_copy_order.order_id = nil
      expect(@movie_copy_order).to_not be_valid
    end
    it "should require a movie_copy_id" do
      @movie_copy_order.movie_copy_id = nil
      expect(@movie_copy_order).to_not be_valid
    end
  end
end