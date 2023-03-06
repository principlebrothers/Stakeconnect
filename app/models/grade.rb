class Grade < ApplicationRecord
  belongs_to :teacher
  has_many :students
  has_many :courses

  validates :teacher_id, presence: true
  validates :grade_num, presence: true, uniqueness: true, numericality: { only_integer: true }
end
