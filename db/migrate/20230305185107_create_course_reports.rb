class CreateCourseReports < ActiveRecord::Migration[7.0]
  def change
    create_table :course_reports do |t|
      t.references :course, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
