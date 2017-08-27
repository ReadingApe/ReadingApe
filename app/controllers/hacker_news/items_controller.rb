class HackerNews::ItemsController < ApplicationController
  def index
    @items = HackerNews::Item.all
  end
end
