class Administrator < User
  def self.type
    %w[HeadTeacher HeadAcademic]
  end

  has_many :courses
  has_many :students
  has_many :administrator_parent_teachers
  has_many :teachers, through: :administrator_parent_teachers
  has_many :parents, through: :administrator_parent_teachers
end
