class AddActivityIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :activity_id, :integer
  end
end
