class CreateParents < ActiveRecord::Migration[7.0]
  def change
    create_table :parents do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.string :email, null: false
      t.string :image, null: false
      t.string :password_confirmation, null: false
      t.integer :role
      t.text :address, null: false

      t.timestamps
    end

    add_index :parents, :email, unique: true
    add_index :parents, :number, unique: true
  end
end
