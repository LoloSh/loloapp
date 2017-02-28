class Clients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :client_id
      t.string :client_password
      t.string :client_name
    end
  end
end
