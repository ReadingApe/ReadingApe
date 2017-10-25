class Story < ApplicationRecord
  validates :hacker_news_item_id, presence: true
  validates :top_rank, :top_at, presence: true, if: ->{ best_rank.nil? }
  validates :best_rank, :best_at, presence: true, if: ->{ top_rank.nil? }

  scope :by_item, ->(item_id) { find_or_initialize_by(hacker_news_item_id: item_id) }

  scope :'top!', ->(item_id, new_rank) { by_item(item_id).top_rank!(new_rank) }
  scope :top, -> { where.not(top_rank: nil).order(top_at: :desc) }

  scope :'best!', ->(item_id, new_rank) { by_item(item_id).best_rank!(new_rank) }
  scope :best, -> { where.not(best_rank: nil).order(best_at: :desc) }

  scope :published, ->(limit=nil) { where('publish_count > 0 and publish_count IS NOT NULL').limit(limit) }
  scope :not_published, ->(limit=nil) { where.not('publish_count > 0 and publish_count IS NOT NULL').limit(limit) }

  def hacker_news_item
    @hacker_news_item ||= HackerNews::Item.find(hacker_news_item_id)
  end

  def summary(short: false)
    comments_url = short ? nil : hacker_news_item.comments_url
    {
      "#{hacker_news_item.title}": "#ApeReading🦍#{id}",
      "✨": [best_rank, top_rank].compact.join('/'),
      "": hacker_news_item.url!,
      HN: comments_url
    }.compact.map{|k,v| [k, v].join(' ')}.join(' ')
  end

  def ranks(cat=nil)
    return '%s %d' % [cat, send( cat + '_rank')] if cat

    {
      best: best_rank,
      top: top_rank
    }.compact.to_a.join(' ')
  end

  def top_rank!(new_rank)
    if top_rank.nil? or new_rank < top_rank
      update_attributes top_rank: new_rank, top_at: Time.now
    end

    self
  end

  def best_rank!(new_rank)
    if best_rank.nil? or new_rank < best_rank
      update_attributes best_rank: new_rank, best_at: Time.now
    end

    self
  end

  def top?
    yield if top_rank?
  end

  def best?
    yield if best_rank?
  end

  def published?
    publish_count and publish_count > 0
  end

  def publish!(force: false, short: false, once: false, body: nil)
    if ! force and published?
      return {error: {id: id, msg: :published}}
    end

    begin
      result = twitter_client.update( body || summary(short: short) )
      if result.id
        update_attributes tweet_id: result.id
        update_attributes publish_count: 1 + (publish_count || 0)
        update_attributes publish_at: Time.now
        return result
      else
        p [:else, result.inspect]
        return result if once
        return publish!(force: force, short: true, once: true, body: body)
      end
    rescue
      p [:rescue, result.inspect]
      return result if once
      return publish!(force: force, short: true, once: true, body: body)
    end
  end

  def self.publish_one!
    best.not_published(1).sampler.map &:'publish!'
  end

  def async_publish
    StoryTweetWorker.perform_async(id, false)
  end

private
  def twitter_client
    @twitter_auth = Authentication.where(provider: "twitter", email: "liulantao+readingape@gmail.com").last
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_API_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_API_SECRET")
      config.access_token        = @twitter_auth.token
      config.access_token_secret = @twitter_auth.secret
    end
  end

  def weibo_client
    @weibo_auth = Authentication.where(provider: "weibo", uid: "5137706648").last

    @weibo_client = WeiboOAuth2::Client.new.tap do |c|
      c.get_token_from_hash({ access_token: "2.00QMShbF7igqdDb7ee6a07d3FEcZBE" })
    end
  end

end
