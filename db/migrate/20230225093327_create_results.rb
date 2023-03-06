class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.date :date
      t.string :type
      t.integer :score
      t.references :course, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
