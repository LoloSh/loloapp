class TableAccessTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :access_tokens do |t|
      t.string :access_token
      t.string :user_id
      t.time :validity_time
      t.datetime :created_date
      t.datetime :updated_date
    end
  end
end
