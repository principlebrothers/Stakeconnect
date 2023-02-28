class RemoveColumnFromTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :grade, :string
    remove_column :users, :phone, :integer
    remove_column :users, :password, :string
    remove_column :users, :password_confirmation, :string
  end
end
