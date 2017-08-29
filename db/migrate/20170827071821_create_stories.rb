class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.references :hacker_news_item, foreign_key: true
      t.integer :top_rank
      t.datetime :top_at

      t.timestamps
    end
  end
end
