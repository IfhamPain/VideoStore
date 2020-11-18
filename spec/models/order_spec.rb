require 'rails_helper'

RSpec.describe Order, type: :model do
  before :all do
    @order = create(:order)
  end
  it "Model should be valid" do
    expect(@order).to be_valid
  end
  it "Must contain either user id or superuser id" do
    @order.user_id=nil
    @order.superuser_id=nil
    expect(@order).to_not be_valid
  end
  it "Expiration date should be later than order date" do
    @order.expiration_date = "1/1/2020"
    @order.order_date = "8/1/2020"
    expect(@order).to_not be_valid
  end
  it "Return date should be later than order date" do
    @order.return_date = "11/11/2020"
    @order.order_date = "17/11/2020"
    expect(@order).to_not be_valid
  end
end