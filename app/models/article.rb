class Article < ApplicationRecord
  belongs_to :user

  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  belongs_to :prefecture

  has_many_attached :images

  scope :tagged_with, lambda { |tag|
    joins(:tags).where(tags: { name: tag })
  }

  def article_image(image)
    if image.present? && image.variable?
      return image.variant(resize_to_fill: [500, 500])
    else
      return image
    end
  end

  def like_count
    likes.count
  end

  def self.ranked_by_likes
    joins(:likes).group(:id).order('count(likes.id) desc')
  end


  def self.search(params)
    articles = all
  
    if params[:keyword].present?
      articles = articles.where('title ILIKE ? OR content ILIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end
  
    if params[:prefecture_id].present?
      articles = articles.where(prefecture_id: params[:prefecture_id])
    end
  
    if params[:tag_ids].present?
      tag_ids = params[:tag_ids].reject(&:blank?)
      if tag_ids.present?
        articles = articles.joins(:tags).where(tags: { id: tag_ids })
      end
    end
  
    articles.distinct
  end
  
end
