# frozen_string_literal: true

module Admin
  # Base controller for admin namespace. Applies authentication and authorization.
  class ApplicationController < ::ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!

    layout 'admin'

    private

    # Only allow users with an admin role to access admin controllers.
    def authorize_admin!
      authorize :admin, :access?
    end
  end
end