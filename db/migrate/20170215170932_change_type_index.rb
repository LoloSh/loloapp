class ChangeTypeIndex < ActiveRecord::Migration[5.0]
  def up
    change_column :access_tokens, :client_id, :integer
    change_column :access_tokens, :user_id, :integer

    change_column :refresh_tokens, :client_id, :integer
    change_column :refresh_tokens, :user_id, :integer


  end
end
