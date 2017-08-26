class Comment < Post
  alias_attribute :commentable_id, :belongs_to_id
  alias_attribute :commentable_type, :belongs_to_type
  validates :content, presence: true
  validates :commentable, presence: true
  belongs_to :commentable, polymorphic: true, foreign_key: :belongs_to_id, foreign_type: :belongs_to_type
end
