class AddTitleToArticleLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :article_links, :title, :string
  end
end
