class ChangeNameIndex < ActiveRecord::Migration[5.0]
  def up
    rename_column :clients, :host_password, :host_secret

  end
end
