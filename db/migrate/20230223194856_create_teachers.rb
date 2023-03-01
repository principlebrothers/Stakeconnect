class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :type, null: false
      t.timestamps
    end
  end
end
