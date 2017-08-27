class HackerNews::List
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0/'
  format :json
  no_follow true
  default_timeout 10

  def self.topstories
    _stories('topstories').tap{|items| items.reverse.each {|item| Story.top_rank!(item.id, item.rank) }}
  end

  def self.newstories
    _stories('newstories')
  end

  def self.askstories
    _stories('askstories')
  end

  def self.showstories
    _stories('showstories')
  end

  def self.jobstories
    _stories('jobstories')
  end

  # { "items" : [], "profiles" : [""] }
  def self.updates
    get("/updates.json").parsed_response
  end

  def self.maxitem
    HackerNews::Item.find(get("/maxitem.json").parsed_response)
  end

  private

  def self._stories(cat, limit=10)
    get("/#{cat}.json").parsed_response.first(limit).map.with_index(1) {|id, rank| HackerNews::Item.find(id).tap {|item| item.rank = rank} }
  end
end
