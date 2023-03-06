class Homework < ApplicationRecord
  belongs_to :course

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :question, presence: true
  validates :course_id, presence: true
end
