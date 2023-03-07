class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :number, null: false
      t.string :image, null: false
      t.string :type, null: false
      t.integer :role

      t.timestamps
    end
  end
end
