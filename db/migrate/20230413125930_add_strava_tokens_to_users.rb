class AddStravaTokensToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :strava_refresh_token, :string
    add_column :users, :strava_token_expires_at, :datetime
    add_column :users, :strava_athlete_id, :integer
  end
end
