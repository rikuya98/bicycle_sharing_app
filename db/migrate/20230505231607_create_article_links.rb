class CreateArticleLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :article_links do |t|
      t.references :article, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
