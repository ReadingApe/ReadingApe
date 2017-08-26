require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    sign_in(create(:user))
    @commentable = build(:user)
    @comment = assign(:comment, create(:comment, commentable: @commentable))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "textarea[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[commentable_id]"
    end
  end
end
