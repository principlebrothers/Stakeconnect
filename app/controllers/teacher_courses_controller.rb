class TeacherCoursesController < ApplicationController
  before_action :set_teacher_course, only: %i[ show update destroy ]

  # GET /teacher_courses
  def index
    @teacher_courses = TeacherCourse.all

    render json: @teacher_courses
  end

  # GET /teacher_courses/1
  def show
    render json: @teacher_course
  end

  # POST /teacher_courses
  def create
    @teacher_course = TeacherCourse.new(teacher_course_params)

    if @teacher_course.save
      render json: @teacher_course, status: :created, location: @teacher_course
    else
      render json: @teacher_course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teacher_courses/1
  def update
    if @teacher_course.update(teacher_course_params)
      render json: @teacher_course
    else
      render json: @teacher_course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teacher_courses/1
  def destroy
    if @teacher_course.destroy
      render json: { message: "TeacherCourse deleted" }, status: :ok
    else
      render json: @teacher_course.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_course
      @teacher_course = TeacherCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teacher_course_params
      params.require(:teacher_course).permit(:teacher_id, :course_id)
    end
end
