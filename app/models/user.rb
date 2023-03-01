class User < ApplicationRecord
  self.inheritance_column = :type

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true
  validates :image, presence: true
  # validates :role, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  def admin?
    type == 'Admin'
  end

  def teacher?
    type == 'Teacher'
  end

  def parent?
    type == 'Parent'
  end
end
