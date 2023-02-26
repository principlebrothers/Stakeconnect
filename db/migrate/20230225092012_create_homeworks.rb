class CreateHomeworks < ActiveRecord::Migration[7.0]
  def change
    create_table :homeworks do |t|
      t.date :start_date
      t.date :end_date
      t.text :question
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
