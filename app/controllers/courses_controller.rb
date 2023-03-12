class CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course, include: {
      grade: { only: [:grade_num] },
      teachers: { only: %i[name email image] },
      results: { only: %i[student_id date type score] },
      homeworks: { only: %i[id start_date end_date question] }
    }
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    if @course.destroy
      render json: { message: 'Course deleted' }, status: :ok
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :semester, :administrator_id, :grade_id)
  end
end
