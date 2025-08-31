class HomeController < ApplicationController
  def index
    @roles = Role.published.recent.limit(10)
    @projects = Project.published.upcoming.by_date.limit(10)
    @events = Event.published.upcoming.by_date.limit(10)
  end
end