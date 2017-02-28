class ChangeIndexName < ActiveRecord::Migration[5.0]
  def up
    rename_column :clients, :host_id, :oauth_id
    rename_column :clients, :host_secret, :oauth_secret
    rename_column :clients, :host_name, :oauth_name
  end
end
