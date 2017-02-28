class ChangeIndexType < ActiveRecord::Migration[5.0]
  def up
    change_column :access_tokens, :validity_time, :datetime

  end
end
