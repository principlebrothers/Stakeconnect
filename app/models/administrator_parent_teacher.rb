class AdministratorParentTeacher < ApplicationRecord
  belongs_to :parent
  belongs_to :teacher
  belongs_to :administrator
end
