class RenameClient < ActiveRecord::Migration[5.0]
  def up
    rename_column :clients, :client_id, :host_id
    rename_column :clients, :client_password, :host_secret
    rename_column :clients, :client_name, :host_name

  end
end
