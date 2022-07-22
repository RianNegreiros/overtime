require 'rails_helper'

describe 'admin dashboard' do
  it 'should be reached successfully' do
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

  it 'should not allow users to access without being signed in' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  it 'should not be reached by a non admin users' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit admin_root_path

    expect(current_path).to eq(root_path)
  end

  it 'should be reached by an admin users' do
    admin_user = FactoryGirl.create(:admin_user)
    login_as(admin_user, :scope => :user)

    visit admin_root_path

    expect(current_path).to eq(admin_root_path)
  end
end