class Story < ApplicationRecord
  validates :hacker_news_item_id, :top_rank, :top_at, presence: true

  scope :by_item, ->(item_id) { find_or_initialize_by(hacker_news_item_id: item_id) }
  scope :'top_rank!', ->(item_id, new_rank) { by_item(item_id).top_rank!(new_rank) }

  def hacker_news_item
    HackerNews::Item.find(hacker_news_item_id)
  end

  def top_rank!(new_rank)
    if top_rank.nil? or new_rank < top_rank
      update_attributes top_rank: new_rank, top_at: Time.now
    end

    self
  end
end
