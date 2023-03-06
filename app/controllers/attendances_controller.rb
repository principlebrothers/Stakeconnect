class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show update destroy]

  # GET /attendances
  def index
    @attendances = Attendance.all

    render json: @attendances
  end

  # GET /attendances/1
  def show
    render json: @attendance, include: {
      student: { only: %i[id name image] }
    }
  end

  # POST /attendances
  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      render json: @attendance, status: :created, location: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendances/1
  def update
    if @attendance.update(attendance_params)
      render json: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendances/1
  def destroy
    if @attendance.destroy
      render json: { message: 'Attendance deleted' }, status: :ok
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.require(:attendance).permit(:date, :present, :absent, :student_id)
  end
end
