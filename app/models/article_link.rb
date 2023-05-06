class ArticleLink < ApplicationRecord
  require 'open-uri'
  require 'nokogiri'

  belongs_to :article
  before_save :fetch_title

  private

  def fetch_title
    begin
      html = open(self.url)
      doc = Nokogiri::HTML(html)
      self.title = doc.title.strip
    rescue
      self.title = "タイトルが取得できませんでした"
    end
  end
end
