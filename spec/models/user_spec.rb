require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = create(:superuser)
  end
  it "Model should be valid" do
    expect(@user).to be_valid
  end
  it "Email format should be correct" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end
  it "First name should be present" do
    @user.first_name=""
    expect(@user).to_not be_valid
  end
  it "Last name should be present" do
    @user.last_name=""
    expect(@user).to_not be_valid
  end

  it "First name should have a maximum of 15 characters" do
    @user.first_name = "a" * 51
    expect(@user).to_not be_valid
  end
  it "Last name should have a maximum of 15 characters" do
    @user.last_name = "a" * 51
    expect(@user).to_not be_valid
  end
  it "Email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).to_not be_valid
  end
  it "email address should be saved in lowercase" do
    mixed_case_email = "sUpeR@tEsT.com"
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq(@user.reload.email)
  end
end
