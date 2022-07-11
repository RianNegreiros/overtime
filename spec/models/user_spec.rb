require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "any@mail.com", password: "any_password", password_confirmation: "any_password", first_name: "any_name", last_name: "any_name")
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without fist_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end