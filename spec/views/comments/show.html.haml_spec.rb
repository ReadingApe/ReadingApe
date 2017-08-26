require 'rails_helper'

RSpec.describe "comments/show", type: :view do
  before(:each) do
    @commentable = create :user
    @comment = assign(:comment, create(:comment, commentable: @commentable))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@comment.content}/)
  end
end
