class AddRefToTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :administrator, foreign_key: true
    add_reference :students, :parent, foreign_key: true
    add_reference :students, :grade, foreign_key: true
    add_reference :teachers, :course, foreign_key: true
  end
end
