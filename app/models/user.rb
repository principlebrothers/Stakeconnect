class User < ApplicationRecord
  self.inheritance_column = :type

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true
  validates :role, presence: true
  validates :password_digest, presence: true, length: { minimum: 6 }
  has_secure_password

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
