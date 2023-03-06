class Course < ApplicationRecord
  belongs_to :administrator
  belongs_to :grade
  has_many :teacher_courses
  has_many :teachers, through: :teacher_courses
  has_many :results
  has_many :homeworks
  has_many :course_reports
  has_many :reports, through: :course_reports

  validates :name, presence: true
  validates :semester, presence: true, numericality: { only_integer: true }
  validates :grade_id, presence: true
  validates :administrator_id, presence: true
end
