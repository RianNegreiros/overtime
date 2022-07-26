require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      @post = FactoryGirl.create(:post)
    end

    it 'should be created' do
      expect(@post).to be_valid
    end

    it 'should not be created without a date and rationale' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end

    it 'should has an overtime request greater than 0.0' do
      @post.overtime_request = 0.0

      expect(@post).to_not be_valid
    end
  end
end