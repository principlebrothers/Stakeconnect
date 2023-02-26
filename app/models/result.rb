class Result < ApplicationRecord
  belongs_to :course

  validates :course_id, presence: true
  validates :date, presence: true
  validates :score, presence: true
end
