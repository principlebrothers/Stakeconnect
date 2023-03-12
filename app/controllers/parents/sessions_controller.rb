# frozen_string_literal: true

class Parents::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Signed in successfully.', data: current_parent }
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                             Rails.application.credentials.fetch(:secret_key_base)).first
    current_parent = Parent.find(jwt_payload['sub'])
    if current_parent
      render json: {
        status: { code: 200, message: 'Signed out successfully.' }
      }, status: :ok
    else
      render json: {
        status: { code: 401, message: 'Unauthorized.' }
      }
    end
  end
end
