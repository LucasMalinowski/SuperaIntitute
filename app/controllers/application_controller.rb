# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Render a generic 404 for unmatched routes
  def route_not_found
    render file: Rails.root.join('public/404.html'), status: :not_found, layout: false
  end

  private

  # Set the locale based on user preference or default to pt‑BR. Can be extended to support additional locales.
  def set_locale
    I18n.locale = params[:locale] || current_user&.locale || I18n.default_locale
  end

  # Handle unauthorized access gracefully.
  def user_not_authorized
    flash[:alert] = I18n.t('authorization.denied')
    redirect_to(request.referer || root_path)
  end
end