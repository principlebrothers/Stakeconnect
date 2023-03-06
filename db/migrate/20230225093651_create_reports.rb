class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.date :date
      t.text :remark
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
