class RemoveStravaTokenAndRefreshTokenFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :strava_token, :string
    remove_column :users, :strava_refresh_token, :string
  end
end
