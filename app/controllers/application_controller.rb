class ApplicationController < ActionController::Base
  allow_browser versions: :modern   # war schon da

  before_action :authenticate_user! # nur eingeloggte User dürfen Seiten sehen
  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_admin
    redirect_to root_path, alert: "Nicht autorisiert" unless current_user&.admin?
  end

  protected

  # Devise erlauben, dass man auch username speichern darf (neben email + password)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
