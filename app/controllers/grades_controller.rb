class GradesController < ApplicationController
  before_action :set_grade, only: %i[show update destroy]

  # GET /grades
  def index
    @grades = Grade.all

    render json: @grades
  end

  # GET /grades/1
  def show
    render json: @grade.to_json(include: {
                                  teacher: { only: %i[id name email image] },
                                  students: { only: %i[id name image] },
                                  courses: { only: %i[id name semester] }
                                })
  end

  # POST /grades
  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      render json: @grade, status: :created, location: @grade
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /grades/1
  def update
    if @grade.update(grade_params)
      render json: @grade
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /grades/1
  def destroy
    if @grade.destroy
      render json: { message: 'Grade deleted successfully' }, status: :ok
    else
      render json: @grade.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_grade
    @grade = Grade.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grade_params
    params.require(:grade).permit(:grade_num, :teacher_id)
  end
end
