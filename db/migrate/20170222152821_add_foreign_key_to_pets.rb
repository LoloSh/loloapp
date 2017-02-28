class AddForeignKeyToPets < ActiveRecord::Migration[5.0]
  def up
    add_foreign_key  :pets, :users


  end
end
