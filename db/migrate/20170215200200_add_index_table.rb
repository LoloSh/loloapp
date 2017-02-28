class AddIndexTable < ActiveRecord::Migration[5.0]
  def up
    add_column :clients, :user_id , :integer
  end
end
