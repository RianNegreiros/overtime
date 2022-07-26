require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'should be created' do
      expect(@post).to be_valid
    end

    it 'should not be created without a date and work_performed' do
      @post.date = nil
      @post.work_performed = nil
      expect(@post).to_not be_valid
    end

    it 'should has an daily request greater than 0.0' do
      @post.daily_hours = 0.0

      expect(@post).to_not be_valid
    end
  end
end