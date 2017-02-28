class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :host_id
      t.string :host_password
      t.string :host_name
    end

    create_table :access_tokens do |t|
      t.string :access_token
      t.string :user_id
      t.string :client_id
      t.time :validity_time

      t.timestamps
    end

    create_table :refresh_tokens do |t|
      t.string :refresh_token
      t.string :user_id
      t.string :client_id

      t.timestamps
    end



  end
end
