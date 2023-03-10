class Article < ApplicationRecord
  belongs_to :user

  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  
  belongs_to :prefecture

  has_many_attached :images

  scope :tagged_with, lambda { |tag|
    joins(:tags).where(tags: { name: tag })
  }
  
  def article_image(image)
    image.variant(resize_to_fill: [500, 500])
  end
end