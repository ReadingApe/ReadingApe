class Post < ApplicationRecord
  has_many :comments, as: :commentable, foreign_key: :belongs_to_id, foreign_type: :belongs_to_type, inverse_of: :commentable
  validates :user, presence: true

  acts_as_followable
  belongs_to :user
end
