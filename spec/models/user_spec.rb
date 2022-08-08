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

    it "should have length 12" do
      @user.phone = "5534567891011"
      expect(@user).to_not be_valid
    end
  end

  describe "relationship between admins and employees" do
    it 'should allows admins to be associated with multiple employees' do
      employee = FactoryGirl.create(:user)
      employee1 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)
      Hand.create!(user_id: admin.id, hand_id: employee.id)
      Hand.create!(user_id: admin.id, hand_id: employee1.id)
      expect(admin.hands.count).to eq(2)
    end
  end
end