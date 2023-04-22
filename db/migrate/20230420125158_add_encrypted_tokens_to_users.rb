class AddEncryptedTokensToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :encrypted_strava_token, :string
    add_column :users, :encrypted_strava_refresh_token, :string
  end
end
