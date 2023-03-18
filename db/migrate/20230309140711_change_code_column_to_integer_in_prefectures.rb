class ChangeCodeColumnToIntegerInPrefectures < ActiveRecord::Migration[6.0]
  def up
    change_column :prefectures, :code, :integer, using: 'code::integer'
  end

  def down
    change_column :prefectures, :code, :string
  end
end
