class HackerNews::ItemsController < ApplicationController

  def top
    @items = HackerNews::Item.top
    render :index
  end

  def best
    @items = HackerNews::Item.best
    render :index
  end

  def async_sync
    StorySyncWorker.perform_async
  end

end
