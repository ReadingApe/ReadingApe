require 'rails_helper'

RSpec.describe Authentication, type: :model do
  describe "#create" do

    it "should increment the count" do
      expect{ create(:authentication) }.to change{Authentication.count}.by(1)
    end

    it "should fail with invalid" do
      expect( build(:invalid_authentication) ).to be_invalid
    end

    it "should fail without :provider" do
      expect( build(:authentication, provider: nil) ).to be_invalid
    end

    it "should fail without :uid" do
      expect( build(:authentication, uid: nil) ).to be_invalid
    end

    it "should fail without :token" do
      expect( build(:authentication, token: nil) ).to be_invalid
    end

  end
end
