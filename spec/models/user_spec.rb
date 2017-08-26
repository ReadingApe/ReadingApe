require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    it "should increment the count" do
      expect{ create(:user) }.to change{User.count}.by(1)
    end

    it "should fail without ::email or :password" do
      expect( build(:user_no_email) ).to be_invalid
      expect( build(:user_no_password) ).to be_invalid
    end
  end

  describe "#email duplicated" do
    it "should fail with UniqueViolation" do
      expect { 2.times {create(:user, email: 'duplicate@email.com')} }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
