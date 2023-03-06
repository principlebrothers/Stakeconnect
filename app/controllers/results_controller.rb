class ResultsController < ApplicationController
  before_action :set_result, only: %i[show update destroy]

  # GET /results
  def index
    @results = Result.all

    render json: @results
  end

  # GET /results/1
  def show
    render json: @result, include: {
      course: { only: %i[name semester] },
      student: { only: %i[id name image] }
    }
  end

  # POST /results
  def create
    @result = Result.new(result_params)

    if @result.save
      render json: @result, status: :created, location: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /results/1
  def update
    if @result.update(result_params)
      render json: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /results/1
  def destroy
    if @result.destroy
      render json: { message: 'Result deleted successfully' }, status: :ok
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_result
    @result = Result.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def result_params
    params.require(:result).permit(:date, :type, :score, :course_id, :student_id)
  end
end
