class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:strava]

  has_one :profile, dependent: :destroy

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorite_articles, through: :likes, source: :article

  delegate :birthday, :gender, :introduction, :bicycle_type, to: :profile, allow_nil: true

  def prepare_profile
    profile || build_profile
  end


  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def avatar_image
    if profile&.avatar&.attached?
     profile.avatar
    else
     'default-avatar.png'
    end
  end

  def age
    return '不明' unless birthday.present?
    years = Time.zone.now.year - birthday.year
    days = Time.zone.now.yday - birthday.yday

    if days < 0
      "#{years - 1}歳"
    else
      "#{years}歳"
    end
  end

  def has_liked?(article)
    likes.exists?(article_id: article.id)
  end


  def self.from_omniauth(auth)
    Rails.logger.debug "Auth object: #{auth.inspect}" # 追加

    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email || "temporary_email_#{auth.uid}@example.com"
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.strava_token = auth.credentials.token
      user.strava_refresh_token = auth.credentials.refresh_token # 追加
      user.strava_token_expires_at = Time.at(auth.credentials.expires_at) # 追加
      
      if user.invalid?
        Rails.logger.debug "Validation errors: #{user.errors.full_messages.join(', ')}"
      end

      user.save!
    end
  end
  
  
end
