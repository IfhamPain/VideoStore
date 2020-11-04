require 'rails_helper'
require "cancan/matchers"
require 'factory_bot'
RSpec.describe Ability, type: :model do
  before :all do
    @user = create(:user)
    @regular_ability = Ability.new(@user,nil)
    @user.role = User.roles[:admin]
    @admin_ability = Ability.new(@user,nil)
    @superuser = create(:superuser)
    @superuser_ability = Ability.new(nil,@superuser)
  end
  describe "Regular User" do
    it "can read users" do
      expect(@regular_ability).to be_able_to(:read, User.new)
    end
    it "cannot create users" do
      expect(@regular_ability).to_not be_able_to(:create, User.new)
    end
    it "cannot edit users" do
      expect(@regular_ability).to_not be_able_to(:edit, User.new)
    end
    it "cannot destroy users" do
      expect(@regular_ability).to_not be_able_to(:destroy, User.new)
    end
  end
  describe "Admin User" do
    it "can read users" do
      expect(@admin_ability).to be_able_to(:read, User.new)
    end
    it "can create users" do
      expect(@admin_ability).to be_able_to(:create, User.new)
    end
    it "can edit users" do
      expect(@admin_ability).to be_able_to(:edit, User.new)
    end
    it "can destroy users" do
      expect(@admin_ability).to be_able_to(:destroy, User.new)
    end
  end
  describe "Superuser" do
    it "can read users" do
      expect(@superuser_ability).to be_able_to(:read, User.new)
    end
    it "can create users" do
      expect(@superuser_ability).to be_able_to(:create, User.new)
    end
    it "can edit users" do
      expect(@superuser_ability).to be_able_to(:edit, User.new)
    end
    it "can destroy users" do
      expect(@superuser_ability).to be_able_to(:destroy, User.new)
    end
  end

end