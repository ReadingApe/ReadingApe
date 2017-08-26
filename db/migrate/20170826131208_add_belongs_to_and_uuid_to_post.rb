class AddBelongsToAndUuidToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :belongs_to, polymorphic: true
    add_column :posts, :uuid, :string
    add_index :posts, :uuid, unique: true
  end
end
