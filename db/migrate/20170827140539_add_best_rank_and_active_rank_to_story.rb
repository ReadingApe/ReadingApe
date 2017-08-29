class AddBestRankAndActiveRankToStory < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :best_rank, :integer
    add_column :stories, :best_at, :datetime
    add_column :stories, :active_rank, :integer
    add_column :stories, :active_at, :datetime
  end
end
