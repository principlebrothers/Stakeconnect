class AddColumnToTable < ActiveRecord::Migration[7.0]
  def change
    add_column :administrators, :jti, :string, null: false
    add_index :administrators, :jti, unique: true
    add_column :parents, :jti, :string, null: false
    add_index :parents, :jti, unique: true
    add_column :teachers, :jti, :string, null: false
    add_index :teachers, :jti, unique: true
  end
end
