class AddTweetIdToStory < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :tweet_id, :string
  end
end
