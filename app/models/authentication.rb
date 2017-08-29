class Authentication < ApplicationRecord
  validates :provider, :uid, :token, presence: true
  belongs_to :user

  def prepare_access_token
    consumer = OAuth::Consumer.new(ENV.fetch('TWITTER_API_KEY'), ENV.fetch('TWITTER_API_SECRET'), { :site => "https://api.twitter.com", :scheme => :header })

    # now create the access token object from passed values
    token_hash = { :oauth_token => token, :oauth_token_secret => secret }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash)

    return access_token
  end
  alias access_token prepare_access_token

end
