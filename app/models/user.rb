class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  self.inheritance_column = :type

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :number, presence: true, uniqueness: true
  validates :image, presence: true
  # validates :role, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def jwt_payload
    super
  end

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
