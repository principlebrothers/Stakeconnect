class Event < ApplicationRecord
  belongs_to :administrator

  validates :date, presence: true
  validates :administrator_id, presence: true
  validates :location, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :semester, presence: true, numericality: { only_integer: true }
end
