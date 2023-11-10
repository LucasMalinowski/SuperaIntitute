class AdminsController < ApplicationController
  layout 'admin_layout'
  before_action :authenticate_user!
  # GET /admins or /admins.json
  def index; end

  def show; end
end
