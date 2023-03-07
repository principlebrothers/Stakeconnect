class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.string :email, null: false
      t.string :image, null: false
      t.string :type, null: false
      t.string :encrypted_password, null: false
      t.integer :role
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at


      t.timestamps
    end
  end
end
