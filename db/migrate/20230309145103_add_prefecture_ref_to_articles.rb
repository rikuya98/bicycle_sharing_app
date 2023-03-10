class AddPrefectureRefToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :prefecture, null: false, foreign_key: true
  end
end
