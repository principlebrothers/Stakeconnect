class CreateAdministratorParentTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :administrator_parent_teachers do |t|
      t.references :parent, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :administrator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
