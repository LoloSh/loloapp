class RenameIndexPets < ActiveRecord::Migration[5.0]
  def up
    rename_column :pets, :type, :race

  end
end
