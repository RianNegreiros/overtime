require 'rails_helper'

describe 'navigate' do
  before do
    user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "any_name", last_name: "any_name")
    login_as(user, :scope => :user)
    visit new_post_path
  end

  describe 'index' do
    it 'should be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'should has title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end

    it 'should has list of posts' do
      post1 = Post.create(date: Date.today, rationale: "Post1")
      post2 = Post.create(date: Date.today, rationale: "Post2")
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    it 'should has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'should be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "any_rationale"
      click_on "Save"

      expect(page).to have_content("any_rationale")
    end

    it 'should have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "any_rationale"
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("any_rationale")
    end
  end
end