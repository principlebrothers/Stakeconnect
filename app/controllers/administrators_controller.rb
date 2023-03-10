class AdministratorsController < ApplicationController
  before_action :set_administrator, only: %i[show update destroy]

  # GET /administrators
  def index
    @administrators = Administrator.all

    render json: @administrators
  end

  # GET /administrators/1
  def show
    render json: @administrator
  end

  # POST /administrators
  def create
    @administrator = Administrator.new(administrator_params)

    if @administrator.save
      render json: { status: :created, administrator: @administrator }
    else
      render json: { status: :unprocessable_entity, errors: @administrator.errors }
    end
  end

  # PATCH/PUT /administrators/1
  def update
    if @administrator.update(administrator_params)
      render json: @administrator
    else
      render json: @administrator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /administrators/1
  def destroy
    if @administrator.destroy
      render json: { message: 'Administrator deleted' }, status: :ok
    else
      render json: @administrator.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_administrator
    @administrator = Administrator.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def administrator_params
    params.require(:administrator).permit(:name, :number, :email, :image, :password)
  end
end