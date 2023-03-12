# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.role == 'admin'
      can :manage, :all
    end

    # Teacher can manage all resources except over super admin and admin
    if user.role == 'teacher'
      can :create, Attendance
      can :update, Attendance, teacher_id: user.id
      can :create, Homework
      can :update, Homework, teacher_id: user.id
      can [:read, :create, :update], CourseReport
      can :create, Report
      can :update, Report, teacher_id: user.id
      can :create, Result
      can :update, Result, teacher_id: user.id
      can :read, [Course, Student, Grade, Parent, Event, Administrator]
      can :read, Teacher, id: user.id
    end

    #
    if user.role == 'parent'
      can :read, Student, parent_id: user.id
      can :read, [Attendance, Report, Result], student: { parent_id: user.id }
      can :read, Course, grade: { students: { parent_id: user.id } }
      can :read, Homework, course: { grade: { students: { parent_id: user.id } } }
      can :read, [Event, Teacher, Administrator]
      can [:read, :update], Parent, id: user.id
    end
  end
end