class Report < ApplicationRecord
  belongs_to :student
  has_many :course_reports
  has_many :courses, through: :course_reports

  validates :date, presence: true
  validates :remark, presence: true
  validates :student_id, presence: true
end
