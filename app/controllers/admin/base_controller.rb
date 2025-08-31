class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :ensure_admin!

  protected

  def set_resource_owner
    return unless params[:id]

    resource_instance = instance_variable_get("@#{controller_name.singularize}")
    return unless resource_instance

    resource_instance.creator = current_user if resource_instance.respond_to?(:creator=)
  end
end