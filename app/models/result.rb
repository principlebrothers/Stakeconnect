class Result < ApplicationRecord
  self.inheritance_column = :type # enable single table inheritance
  
  belongs_to :course

  validates :course_id, presence: true
  validates :date, presence: true
  validates :score, presence: true
end
