class Story < ApplicationRecord
  validates :hacker_news_item_id, presence: true
  validates :top_rank, :top_at, presence: true, if: ->{ best_rank.nil? }
  validates :best_rank, :best_at, presence: true, if: ->{ top_rank.nil? }

  scope :by_item, ->(item_id) { find_or_initialize_by(hacker_news_item_id: item_id) }

  scope :'top!', ->(item_id, new_rank) { by_item(item_id).top_rank!(new_rank) }
  scope :top, -> { where.not(top_rank: nil).order(top_at: :desc) }

  scope :'best!', ->(item_id, new_rank) { by_item(item_id).best_rank!(new_rank) }
  scope :best, -> { where.not(best_rank: nil).order(best_at: :desc) }

  def hacker_news_item
    HackerNews::Item.find(hacker_news_item_id)
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

end
