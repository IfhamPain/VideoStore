require 'rails_helper'

RSpec.describe Superuser, type: :model do
  before :all do
    @superuser = create(:superuser)
  end
  it "Model should be valid" do
    expect(@superuser).to be_valid
  end
  it "Email format should be correct" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @superuser.email = valid_address
      expect(@superuser).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end
  it "First name should be present" do
    @superuser.first_name=""
    expect(@superuser).to_not be_valid
  end
  it "Last name should be present" do
    @superuser.last_name=""
    expect(@superuser).to_not be_valid
  end

  it "First name should have a maximum of 15 characters" do
    @superuser.first_name = "a" * 51
    expect(@superuser).to_not be_valid
  end
  it "Last name should have a maximum of 15 characters" do
    @superuser.last_name = "a" * 51
    expect(@superuser).to_not be_valid
  end
  it "Email should be unique" do
    duplicate_user = @superuser.dup
    duplicate_user.email = @superuser.email.upcase
    @superuser.save
    expect(duplicate_user).to_not be_valid
  end
  it "email address should be saved in lowercase" do
    mixed_case_email = "sUpeR@tEsT.com"
    @superuser.email = mixed_case_email
    @superuser.save
    expect(mixed_case_email.downcase).to eq(@superuser.reload.email)
  end
end
