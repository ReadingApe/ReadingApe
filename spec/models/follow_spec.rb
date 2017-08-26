require 'rails_helper'

RSpec.describe Follow, type: :model do
  it "should increment the count" do
    expect{ create(:follow) }.to change{Follow.count}.by(1)
  end

  it "can follow" do
    follower = create(:user)
    followable = create(:user)

    expect{ follower.follow(followable) }.to change{Follow.count}.by(1)
    expect( follower.follow?(followable) ).to be true
  end

  it "should fail without :follower" do
    expect( build(:follow, follower: nil) ).to be_invalid
  end

  it "should fail without :followable" do
    expect( build(:follow, followable: nil) ).to be_invalid
  end
end
