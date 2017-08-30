class User < ApplicationRecord
  has_many :comments, as: :commentable, foreign_key: :belongs_to_id, foreign_type: :belongs_to_type, inverse_of: :commentable
  has_many :user_comments, class_name: 'Comment'
  acts_as_followable
  acts_as_follower
  has_many :authentications, autosave: true, dependent: :destroy

  def self.from_omniauth(auth, current_user)
    # 1. find link auth -> user_id
    # 2. if logged in, link auth -> user_id
    # 3. if verified email, create link auth email -> user email
    authentication = Authentication.where( provider: auth.provider, uid: auth.uid.to_s ).first_or_initialize do |authentication|
      authentication.token = auth.credentials.token
      authentication.secret = auth.credentials.secret

      authentication.email = auth.info.email
      authentication.name = auth.info.name
      authentication.nickname = auth.info.nickname
      authentication.image = auth.info.image

      authentication.user = current_user || authentication.user || (User.where( email: auth.info.email ).first_or_initialize if email_verified?(auth)) || User.new
      authentication.user.authentications << authentication
    end

    authentication.user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.user_attributes']
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.email_verified?(auth)
    case auth.provider
    when 'github'
      auth.extra.all_emails.select {|e| e.email == auth.info.email and e.verified == true }.size > 0
    when 'twitter'
      true
    when 'facebook'
      true
    when 'google_oauth2'
      auth.extra.id_info.email_verified
    when 'weibo'
      false
    else
      false
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
end
