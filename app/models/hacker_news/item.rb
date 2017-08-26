class HackerNews::Item < ActiveResource::Base
  self.site = 'https://hacker-news.firebaseio.com/v0/'
  self.collection_name = :item

  def self.all
    HackerNews::List.topstories
  end

  def self.last
    HackerNews::List.maxitem
  end

end
