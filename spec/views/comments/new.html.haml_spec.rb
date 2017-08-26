require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    sign_in(create(:user))
    @commentable = create :user
    assign(:comment, build(:comment, commentable: @commentable))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", user_comments_path(@commentable), "post" do

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "textarea[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[commentable_id]"
    end
  end
end
