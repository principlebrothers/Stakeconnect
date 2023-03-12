class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.string :email, null: false
      t.string :image, null: false
      t.string :role, null: false, default: 'admin'

      t.timestamps
    end
  end
end
