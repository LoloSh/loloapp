class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :surname
      t.string :email
      t.string :hashpw
      t.date :birthday
      t.string :role
      t.string :position

      t.timestamps
    end
  end
end
