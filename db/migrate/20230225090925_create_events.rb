class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :date, null: false
      t.string :location, null: false
      t.string :image
      t.time :time
      t.string :title, null: false
      t.text :description, null: false
      t.integer :semester, null: false
      t.references :administrator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
