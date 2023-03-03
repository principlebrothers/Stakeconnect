class Parent < User
  self.table_name = 'parents'
  
  attribute :address, :text

  has_many :students
  has_many :administrator_parent_teachers
  has_many :teachers, through: :administrator_parent_teachers
  has_many :administrators, through: :administrator_parent_teachers

  validates :address, presence: true
end
