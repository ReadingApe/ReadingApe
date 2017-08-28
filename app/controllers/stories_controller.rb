class StoriesController < ApplicationController

  def top
    @stories = Story.top
    render :index
  end

  def best
    @stories = Story.best
    render :index
  end

  def preview
    @story = Story.find(params[:id])
  end

  def publish
    @result = params[:summary]

    respond_to do |format|
      format.js
    end
  end

end
