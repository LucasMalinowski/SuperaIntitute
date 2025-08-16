# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @events = EventQuery.new.upcoming.limit(3)
    @projects = Project.upcoming.limit(3)
    @roles = Role.order(created_at: :desc).limit(3)
  end

  def about; end

  def contact; end

  def accessibility_statement; end
  def privacy_policy; end
  def cookies_policy; end
end