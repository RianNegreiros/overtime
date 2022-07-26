require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:post) do
    Post.create(date: Date.today, rationale: "any_rationale", user_id: user.id)
  end

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
      FactoryGirl.build_stubbed(:post)
      FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end

    it 'should has a scope so that only post creators can see their posts' do
      Post.create(date: Date.today, rationale: "any_rationale", user_id: @user.id)
      Post.create(date: Date.today, rationale: "any_rationale", user_id: @user.id)

      other_user = User.create(first_name: 'other', last_name: 'user', email: "other@mail.com", password: "any_password", password_confirmation: "any_password")
      Post.create(date: Date.today, rationale: "other_rationale", user_id: other_user.id)

      visit posts_path

      expect(page).to_not have_content(/other_rationale/)
    end
  end

  describe 'new' do
    it 'should has a link from the homepage' do
      visit root_path

      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
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
  
  describe 'delete' do
    it 'should be deleted' do
      logout(:user)

      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, :scope => :user)

      post_to_delete = Post.create(date: Date.today, rationale: 'any_rationale', user_id: delete_user.id)

      visit posts_path
      click_link("delete_post_#{post_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    before do
      @edit_user = User.create(first_name: "any", last_name: "any", email: "any@mail.com", password: "any_password", password_confirmation: "any_password")
      login_as(@edit_user, :scope => :user)
      @edit_post = Post.create(date: Date.today, rationale: "any", user_id: @edit_user.id)
    end

    it 'should be edited' do
      visit edit_post_path(@edit_post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on "Save"

      expect(page).to have_content("Edited content")
    end

    it 'should not be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(@edit_post)

      expect(current_path).to eq(root_path)
    end
  end
end