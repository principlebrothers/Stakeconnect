class ReportsController < ApplicationController
  before_action :set_report, only: %i[show update destroy]

  # GET /reports
  def index
    @reports = Report.includes([:courses]).all

    render json: @reports, include: {
      courses: { only: %i[name semester],
                 include: { results: { only: %i[type score student_id] } } }
    }
  end

  # GET /reports/1
  def show
    render json: @report.to_json(include: {
                                   student: { only: %i[id name image] },
                                   courses: { only: %i[name semester],
                                              include: { results: { only: %i[type score student_id] } } }
                                 })
  end

  # POST /reports
  def create
    @report = Report.new(report_params)

    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    if @report.destroy
      render json: { message: 'Report deleted successfully' }, status: :ok
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:date, :remark, :student_id)
  end
end
