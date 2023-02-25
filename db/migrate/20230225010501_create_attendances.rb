class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.date :date
      t.boolean :present
      t.boolean :absent
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
