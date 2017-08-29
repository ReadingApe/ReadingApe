class AddPublishToStory < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :publish_count, :integer
    add_column :stories, :publish_at, :datetime
  end
end
