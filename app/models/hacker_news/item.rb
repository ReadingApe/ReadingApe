class HackerNews::Item < ActiveResource::Base
  self.site = 'https://hacker-news.firebaseio.com/v0/'
  self.collection_name = :item
  cached_resource enabled: true, ttl: 1024, race_condition_ttl: 120, ttl_randomization: true, ttl_randomization_scale: 0.8..1.2

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

  def url!
    url? ? url : 'https://news.ycombinator.com/item?id=%d' % id
  end

end
