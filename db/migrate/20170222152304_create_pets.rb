class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.integer :user_id

      t.timestamps
    end

    def up
      add_foreign_key  :pets, :users


    end
  end
end
