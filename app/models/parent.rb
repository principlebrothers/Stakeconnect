class Parent < ApplicationRecord
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
  validates :address, presence: true
  validates :role, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :students
  has_many :administrator_parent_teachers
  has_many :teachers, through: :administrator_parent_teachers
  has_many :administrators, through: :administrator_parent_teachers

  def role
    'parent'
  end
end
