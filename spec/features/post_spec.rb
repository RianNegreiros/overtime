require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'should be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'should has title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'should has list of posts' do
      FactoryGirl.create(:post)
      FactoryGirl.create(:second_post)
      visit posts_path
      expect(page).to have_content(/any_rationale/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

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
  
  describe 'new' do
    before do
      visit new_post_path
    end
    
    it 'should has a link from the homepage' do
      expect(page.status_code).to eq(200)
    end
  end
  
  describe 'edit' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'should be reached by clicking edit on index page' do
      visit posts_path

      click_link 'Edit'
      expect(page.status_code).to eq(200)
    end

    it 'should be edited' do
      visit edit_post_path(@post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'edited_content'
      click_on 'Save'

      expect(page).to have_content('edited_content')
    end
  end
end