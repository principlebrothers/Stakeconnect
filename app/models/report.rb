class Report < ApplicationRecord
  belongs_to :student
  belongs_to :result

  validates :date, presence: true
  validates :student_id, presence: true
  validates :result_id, presence: true
end
