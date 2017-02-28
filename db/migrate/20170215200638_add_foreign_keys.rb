class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key  :access_tokens, :users
    add_foreign_key  :refresh_tokens, :users
    add_foreign_key  :clients, :users
    add_foreign_key  :access_tokens, :clients
    add_foreign_key  :refresh_tokens, :clients

  end
end
