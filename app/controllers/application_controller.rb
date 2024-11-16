class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :current_user

  def current_user
    current_user = HospitalStaff.find_by(id: session.dig("warden.user.hospital_staff.key", 0)&.first)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :role, :specialists, :total_experience])
  end

  def authenticate_user!
    redirect_to login_path unless current_user
  end
end