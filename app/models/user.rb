require 'attr_encrypted'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:strava, :google_oauth2]

  has_one :profile, dependent: :destroy

  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorite_articles, through: :likes, source: :article

  delegate :birthday, :gender, :introduction, :bicycle_type, to: :profile, allow_nil: true

  attr_encrypted :strava_token, key: ENV['STRAVA_TOKEN_ENCRYPTION_KEY']
  attr_encrypted :strava_refresh_token, key: ENV['STRAVA_REFRESH_TOKEN_ENCRYPTION_KEY']


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

  def profile_completed?
    profile&.nickname.present? && profile&.gender.present? && profile&.birthday.present?
  end

  def strava_linked?
    strava_token.present?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email || "temporary_email_#{auth.uid}@example.com"
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
 
      user.save!
    end
  end

  def update_strava_auth(auth)
    update(
      strava_token: auth.credentials.token,
      strava_refresh_token: auth.credentials.refresh_token,
      strava_token_expires_at: Time.at(auth.credentials.expires_at)
    )
  end


  def strava_authenticated?
    encrypted_strava_token.present? && encrypted_strava_refresh_token.present? && token_not_expired?
  end

  private

  def token_not_expired?
    return false if strava_token_expires_at.nil?
    Time.now < strava_token_expires_at
  end

end
