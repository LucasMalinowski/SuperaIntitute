class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::UnpermittedParameters, with: :bad_request

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def ensure_admin!
    redirect_to root_path, alert: 'Access denied.' unless current_user&.admin?
  end

  def not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def bad_request
    render json: { error: 'Bad request' }, status: :bad_request
  end
end
