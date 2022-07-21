require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'should be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    it 'should has a new form that can be reached' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end
  end
end