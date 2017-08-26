class Authentication < ApplicationRecord
  validates :provider, :uid, :token, presence: true
  belongs_to :user
end
