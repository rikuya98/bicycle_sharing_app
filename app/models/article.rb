class Article < ApplicationRecord
  belongs_to :user

  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many_attached :images

  def article_image(image)
    image.variant(resize_to_fill: [500, 500])
  end
end
