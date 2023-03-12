class Administrators::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: resource
      }
    else
      render json: {
        status: { code: 422, message: resource.errors.full_messages.join(',') }
      }
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name number image])
  end
end
