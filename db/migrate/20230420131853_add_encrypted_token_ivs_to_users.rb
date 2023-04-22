class AddEncryptedTokenIvsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :encrypted_strava_token_iv, :string
    add_column :users, :encrypted_strava_refresh_token_iv, :string
  end
end
