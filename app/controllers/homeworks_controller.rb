class HomeworksController < ApplicationController
  before_action :set_homework, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /homeworks
  def index
    @homeworks = Homework.all

    render json: @homeworks
  end

  # GET /homeworks/1
  def show
    @homework = Homework.includes(:course).find(params[:id])

    render json: { course_name: @homework.course.name, question: @homework.question, start_date: @homework.start_date,
                   end_date: @homework.end_date }
  end

  # POST /homeworks
  def create
    @homework = Homework.new(homework_params)

    if @homework.save
      render json: @homework, status: :created, location: @homework
    else
      render json: @homework.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /homeworks/1
  def update
    if @homework.update(homework_params)
      render json: @homework
    else
      render json: @homework.errors, status: :unprocessable_entity
    end
  end

  # DELETE /homeworks/1
  def destroy
    if @homework.destroy
      render json: { message: 'Homework deleted successfully' }, status: :ok
    else
      render json: @homework.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_homework
    @homework = Homework.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def homework_params
    params.require(:homework).permit(:start_date, :end_date, :question, :course_id)
  end
end
