class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.string :type
      t.integer :role

      t.timestamps
    end
  end
end
