require 'rails_helper'

describe 'audit log' do
  describe "index" do
    before do
      admin_user = FactoryGirl.create(:admin_user)
      login_as(admin_user, :scope => :user)
      FactoryGirl.create(:audit_log)
    end

    it 'should has an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'should render audit log content' do
      visit audit_logs_path
      expect(page).to have_content(/NAME, ANY/)
    end

    it 'should not be accessed bu non admin users' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)

      visit audit_logs_path

      expect(current_path).to eq(root_path)
    end
  end
end