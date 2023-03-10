# frozen_string_literal: true

class Administrators::RegistrationsController < Devise::RegistrationsController
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
end
