class Attendance < ApplicationRecord
  belongs_to :student

  validates :date, presence: true
  validates :student_id, presence: true
end
