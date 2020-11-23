require 'rails_helper'
RSpec.describe Actor, type: :model do
  before :all do
    @actor = create(:actor)
  end
  it "Model should be valid" do
    expect(@actor).to be_valid
  end
  it "Name should be present" do
    @actor.name=""
    expect(@actor).to_not be_valid
  end
  it "Name should be less than 50 characters" do
    @actor.name="a*51"
    expect(@actor).to_not be_valid
  end
  it "Name should be valid" do
    @actor.title="a*50"
    expect(@actor).to be_valid
  end
  it "Date of birth should be present" do
    @actor.date_of_birth=""
    expect(@actor).to_not be_valid
  end
  it "Date of birth should be valid" do
    @actor.date_of_birth= Date.tomorrow
    expect(@actor).to_not be_valid
  end
end