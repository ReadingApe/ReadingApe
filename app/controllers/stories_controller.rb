class StoriesController < ApplicationController

  def top
    @stories = Story.top
    render :index
  end

  def best
    @stories = Story.best
    render :index
  end

end
