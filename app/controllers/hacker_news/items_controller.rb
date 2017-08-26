class HackerNews::ItemsController < ApplicationController
  def index
    @items = HackerNews::Item.all
  end

  def show
    @item = HackerNews::Item.find(params[:id])
  end
end
