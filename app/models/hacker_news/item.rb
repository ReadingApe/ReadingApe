class HackerNews::Item < ActiveResource::Base
  self.site = 'https://hacker-news.firebaseio.com/v0/'
  self.collection_name = :item
end
