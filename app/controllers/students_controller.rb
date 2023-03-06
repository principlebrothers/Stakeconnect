class StudentsController < ApplicationController
  before_action :set_student, only: %i[show update destroy]

  # GET /students
  def index
    @students = Student.all

    render json: @students.to_json(include: {
                                     parent: { only: %i[name email number address] },
                                     grade: { only: [:grade_num] }
                                   })
  end

  # GET /students/1
  def show
    render json: @student.to_json(include: {
                                    parent: { only: %i[name email number address] },
                                    grade: { only: [:grade_num] },
                                    reports: { only: %i[date remark],
                                               include: { courses: { only: %i[name semester],
                                                                     include: { results: { only: %i[type score
                                                                                                    date] } } } } }
                                  })
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student = set_student
    if @student.destroy
      render json: { message: 'Student deleted successfully' }, status: :ok
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:name, :image, :parent_id, :grade_id, :administrator_id)
  end
end
