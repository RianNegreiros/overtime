require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe 'validations' do
    it "should not be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "should not be created without last_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "should not be created without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it "should only contains integers" do
      @user.phone = 'any_phone'
      expect(@user).to_not be_valid
    end

    it "should have length 10" do
      @user.phone = "12345678910"
      expect(@user).to_not be_valid
    end
  end
end