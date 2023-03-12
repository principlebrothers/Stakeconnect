class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied do |exception|
    render json: { message: exception.message }, status: :unauthorized
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { message: exception.message }, status: :not_found
  end

  private

  def current_user
    current_administrator || current_teacher || current_parent
  end
end
