class Student < ApplicationRecord
  belongs_to :parent
  belongs_to :grade
  has_many :courses, through: :grade
  has_many :results
  has_many :reports

  validates :name, presence: true
  validates :parent_id, presence: true
  validates :image, presence: true
  validates :grade_id, presence: true
end
