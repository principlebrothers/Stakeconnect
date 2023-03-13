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

  def authenticate_teacher!
    if current_user.present? && (current_user.role == 'teacher' || current_user.role == 'admin')
      true
    else
      render json: { message: 'You are not authorized to access this page' }, status: :unauthorized
    end
  end

  def authenticate_parent!
    if current_user.present? && (current_user.role == 'parent' || current_user.role == 'admin')
      true
    else
      render json: { message: 'You are not authorized to access this page' }, status: :unauthorized
    end
  end
end
