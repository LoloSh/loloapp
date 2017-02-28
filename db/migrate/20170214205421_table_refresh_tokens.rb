class TableRefreshTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :refresh_tokens do |t|
      t.string :refresh_token
      t.string :user_id
      t.string :client_id
      t.time :validity_time

      t.timestamps
      end
  end
end
