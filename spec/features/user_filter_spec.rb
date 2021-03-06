require "rails_helper"
require 'database_cleaner'

RSpec.feature "User Filter", :type => :feature do

  before :all do

    @user = create(:user)
    @fname = "member"
    @lname = "user"
    @email = @user.email
    @gender = @user.gender
    @role = User.roles[:member]
  end

  describe "test user filter" do
    it "Filter first name test" do
      expect do
        @users = User.filter_by_fname(@fname)
      end.to change{@users.count}.by(1)
    end
    it "Filter last name" do
      expect do
        @users = User.filter_by_lname(@lname)
      end.to change{@users.count}.by(1)
    end
    it "Filter email" do
      expect do
        @users = User.filter_by_email(@email)
      end.to change{@users.count}.by(1)
    end
    it "Filter gender" do
      expect do
        @users = User.filter_by_gender(@gender)
      end.to change{@users.count}.by(1)
    end
    it "Filter role" do
      expect do
        @users = User.filter_by_role(@role)
      end.to change{@users.count}.by(1)
    end
    it "Filter firstname and lastname" do
      expect do
        @users = User.filter_by_fname(@fname)
        @users = @users.filter_by_lname(@lname)
      end.to change{@users.count}.by(1)
    end
    it "Filter firstname and gender" do
      expect do
        @users = User.filter_by_fname(@fname)
        @users = @users.filter_by_gender(@gender)
      end.to change{@users.count}.by(1)
    end
    it "Filter lastname and gender" do
      expect do
        @users = User.filter_by_lname(@lname)
        @users = @users.filter_by_gender(@gender)
      end.to change{@users.count}.by(1)
    end
    it "Filter firstname and role" do
      expect do
        @users = User.filter_by_fname(@fname)
        @users = @users.filter_by_role(@role)
      end.to change{@users.count}.by(1)
    end
    it "Filter lastname and role" do
      expect do
        @users = User.filter_by_lname(@lname)
        @users = @users.filter_by_role(@role)
      end.to change{@users.count}.by(1)
    end
    it "Filter gender and role" do
      expect do
        @users = User.filter_by_gender(@gender)
        @users = @users.filter_by_role(@role)
      end.to change{@users.count}.by(1)
    end
    it "Filter firstname, lastname, email and gender" do
      expect do
        @users = User.filter_by_fname(@fname)
        @users = @users.filter_by_lname(@lname)
        @users = @users.filter_by_email(@email)
        @users = @users.filter_by_gender(@gender)
        @users = @users.filter_by_role(@role)
      end.to change{@users.count}.by(1)
    end
  end
end

