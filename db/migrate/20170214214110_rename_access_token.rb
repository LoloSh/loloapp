class RenameAccessToken < ActiveRecord::Migration[5.0]
  def up
    rename_column :access_tokens, :created_date, :created_at
    rename_column :access_tokens, :updated_date, :updated_at


  end
end
