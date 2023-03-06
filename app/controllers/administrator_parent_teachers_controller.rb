class AdministratorParentTeachersController < ApplicationController
  before_action :set_administrator_parent_teacher, only: %i[show update destroy]

  # GET /administrator_parent_teachers
  def index
    @administrator_parent_teachers = AdministratorParentTeachers.all

    render json: @administrator_parent_teachers
  end

  # GET /administrator_parent_teachers/1
  def show
    render json: @administrator_parent_teacher
  end

  # POST /administrator_parent_teachers
  def create
    @administrator_parent_teacher = AdministratorParentTeachers.new(administrator_parent_teacher_params)

    if @administrator_parent_teacher.save
      render json: @administrator_parent_teacher, status: :created, location: @administrator_parent_teacher
    else
      render json: @administrator_parent_teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /administrator_parent_teachers/1
  def update
    if @administrator_parent_teacher.update(administrator_parent_teacher_params)
      render json: @administrator_parent_teacher
    else
      render json: @administrator_parent_teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /administrator_parent_teachers/1
  def destroy
    if @administrator_parent_teacher.destroy
      render json: { message: 'AdministratorParentTeacher deleted' }, status: :ok
    else
      render json: @administrator_parent_teacher.errors, status: :unprocessable_entity
    end
  end

  private

  def set_administrator_parent_teacher
    @administrator_parent_teacher = AdministratorParentTeachers.find(params[:id])
  end

  def administrator_parent_teacher_params
    params.require(:administrator_parent_teacher).permit(:administrator_id, :parent_id, :teacher_id)
  end
end
