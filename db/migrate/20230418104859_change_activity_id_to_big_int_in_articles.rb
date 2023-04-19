class ChangeActivityIdToBigIntInArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :activity_id, :bigint
  end
end