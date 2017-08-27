class StoriesController < ApplicationController
  def index
    @stories = Story.order(top_at: :desc)
  end
end
