class CreateParents < ActiveRecord::Migration[7.0]
  def change
    create_table :parents do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.string :email, null: false
      t.string :image, null: false
      t.string :role, null: false, default: 'parent'
      t.text :address, null: false

      t.timestamps
    end

  end
end
