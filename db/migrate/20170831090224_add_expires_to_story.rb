class AddExpiresToStory < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :expires, :boolean
    add_column :stories, :expires_at, :datetime
  end
end
