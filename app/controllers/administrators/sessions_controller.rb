class Administrators::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Signed in successfully.', data: current_administrator }
    }, status: :ok
  end

  # rubocop:disable Style/RedundantArgument
  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                             Rails.application.credentials.fetch(:secret_key_base)).first
    current_administrator = Administrator.find(jwt_payload['sub'])
    if current_administrator
      render json: {
        status: { code: 200, message: 'Signed out successfully.' }
      }, status: :ok
    else
      render json: {
        status: { code: 401, message: 'Unauthorized.' }
      }
    end
  end
  # rubocop:enable Style/RedundantArgument
end
