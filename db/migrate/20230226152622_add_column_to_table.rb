class AddColumnToTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :image, :string
    add_column :students, :image, :string
    add_column :users, :phone, :integer
    add_column :users, :type, :string
    add_column :teachers, :type, :string
    add_column :parents, :type, :string
  end
end
