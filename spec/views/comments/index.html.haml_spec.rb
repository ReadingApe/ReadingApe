require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    @commentable = create :user
    @comments = assign(:comments, Kaminari.paginate_array(create_list(:comment, 2, commentable: @commentable)).page(1))
  end

  it "renders a list of comments" do
    expect(@comments.size).to be(2)

    render

    @comments.each do |comment|
      assert_select "#comments .comment-content", text: comment.content.to_s, count: 1
    end
  end
end
