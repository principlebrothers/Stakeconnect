class ParentsController < ApplicationController
  before_action :authenticate_parent!
  before_action :set_parent, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /parents
  def index
    @parents = Parent.all

    render json: @parents
  end

  # GET /parents/1
  def show
    render json: @parent.to_json(include: {
                                   students: {
                                     only: %i[id name image],
                                     include: { grade: { only: [:grade_num] } }
                                   }
                                 })
  end

  # POST /parents
  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      render json: @parent, status: :created, location: @parent
    else
      render json: @parent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parents/1
  def update
    if @parent.update(parent_params)
      render json: @parent
    else
      render json: @parent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parents/1
  def destroy
    if @parent.destroy
      render json: { message: 'Parent deleted successfully' }, status: :ok
    else
      render json: @parent.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent
    @parent = Parent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parent_params
    params.require(:parent).permit(:name, :number, :email, :image, :role, :address, :password)
  end
end
