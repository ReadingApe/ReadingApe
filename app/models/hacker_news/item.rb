class HackerNews::Item < ActiveResource::Base
  self.site = 'https://hacker-news.firebaseio.com/v0/'
  self.collection_name = :item

  def self.all
    self.top
  end

  def self.top
    HackerNews::List.topstories
  end

  def self.best
    HackerNews::List.beststories
  end

  def self.active
    HackerNews::List.activestories
  end

  def self.last
    HackerNews::List.maxitem
  end

end
