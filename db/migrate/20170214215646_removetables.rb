class Removetables < ActiveRecord::Migration[5.0]
  def up
    drop_table :clients
    drop_table :refresh_tokens
    drop_table :access_tokens
  end
end
