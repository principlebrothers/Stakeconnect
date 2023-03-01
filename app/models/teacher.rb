class Teacher < User
  has_many :grades
  has_many :students, through: :grades
  has_many :teacher_courses
  has_many :courses, through: :teacher_courses
  has_many :administrator_parent_teachers
  has_many :parents, through: :administrator_parent_teachers
end
