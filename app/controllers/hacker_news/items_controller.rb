class HackerNews::ItemsController < ApplicationController

  def top
    @items = HackerNews::Item.top
    render :index
  end

  def best
    @items = HackerNews::Item.best
    render :index
  end

end
