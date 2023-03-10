class Teacher < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true
  validates :image, presence: true
  # validates :role, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :grades
  has_many :students, through: :grades
  has_many :teacher_courses
  has_many :courses, through: :teacher_courses
  has_many :administrator_parent_teachers
  has_many :parents, through: :administrator_parent_teachers

  def jwt_payload
    super
  end
end
