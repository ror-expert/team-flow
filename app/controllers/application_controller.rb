class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :company_name, :email, :password, :password_confirmation) }
    end

  private
    def layout
      # only turn it off for login pages:
      if is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController)
        "login"
      else
        "application"
      end
      # or turn layout off for every devise controller:
      #devise_controller? && "application"
    end
end
