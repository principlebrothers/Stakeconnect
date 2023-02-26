class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.integer :grade_num
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
