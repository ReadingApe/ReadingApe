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
    @result = {status: params[:summary], length: params[:summary].length}  # default
    @result = twitter_client.update params[:summary] if params[:publish]

    respond_to do |format|
      format.js
    end
  end

  private

  def twitter_client
    @twitter_auth = Authentication.last
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_API_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_API_SECRET")
      config.access_token        = @twitter_auth.token
      config.access_token_secret = @twitter_auth.secret
    end
  end

end
