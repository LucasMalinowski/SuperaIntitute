class MainController < ApplicationController
  # GET /
  def index
    @roles = Admins::Role.all
    @projects = Admins::Project.all.upcoming
    @events = Admins::Event.all.upcoming
  end
end
