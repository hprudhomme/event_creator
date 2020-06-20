class ApplicationController < ActionController::Base
    private

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :birthdate, :country, :city])
            devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :birthdate, :country, :city, :description, :profession])
        end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  before_action :set_admin
  def set_admin
    @event = Event.new
  end
end
