class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :semester
      t.references :administrator, null: false, foreign_key: true
      t.references :grade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
