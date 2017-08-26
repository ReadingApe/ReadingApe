require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "#create" do
    it "should increment the count" do
      expect{ create(:post) }.to change{Post.count}.by(1)
    end

    it "should fail with invalid" do
      expect( build(:invalid_post) ).to be_invalid
    end

    it "should fail without :user" do
      expect( build(:post, user: nil) ).to be_invalid
    end

    it "should success without :title" do
      expect( build(:post, title: nil) ).to be_valid
    end

    it "should success without :content" do
      expect( build(:post, content: nil) ).to be_valid
    end
  end

  describe "followable" do
    it "can be followed by user" do
      follower = create(:user)
      followable = create(:post)
      expect{ follower.follow(followable) }.to change{Follow.count}.by(1)
      expect( follower.follow?(followable) ).to be true
    end
  end
end
