class CourseReportsController < ApplicationController
  before_action :set_course_report, only: %i[show update destroy]

  # GET /course_reports
  def index
    @course_reports = CourseReport.all

    render json: @course_reports
  end

  # GET /course_reports/1
  def show
    render json: @course_report
  end

  # POST /course_reports
  def create
    @course_report = CourseReport.new(course_report_params)

    if @course_report.save
      render json: @course_report, status: :created, location: @course_report
    else
      render json: @course_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /course_reports/1
  def update
    if @course_report.update(course_report_params)
      render json: @course_report
    else
      render json: @course_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /course_reports/1
  def destroy
    @course_report.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_report
    @course_report = CourseReport.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_report_params
    params.require(:course_report).permit(:course_id, :report_id)
  end
end
