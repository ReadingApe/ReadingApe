class StoriesController < ApplicationController

  def top
    @stories = Story.top.page(params[:page])
    render :index
  end

  def best
    @stories = Story.best.page(params[:page])
    render :index
  end

  def preview
    @story = Story.find(params[:id])
  end

  def publish
    @story = Story.find(params[:id])
    @result = {status: params[:summary], length: params[:summary].length}  # default
    @result = @story.publish!(body: params[:summary]) if params[:publish]

    respond_to do |format|
      format.js
    end
  end

  def publish_one
    @result = Story.publish_one!

    respond_to do |format|
      format.json { render json: @result}
    end
  end

end
