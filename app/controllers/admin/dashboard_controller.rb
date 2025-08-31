class Admin::DashboardController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @stats = {
      events_count: Event.count,
      projects_count: Project.count,
      roles_count: Role.count,
      users_count: User.count,
      recent_events: Event.recent.limit(5),
      recent_projects: Project.recent.limit(5),
      recent_roles: Role.recent.limit(5)
    }
  end
end