# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @projects = Project.all.page(params[:page]).per(6)
  end

  def show
    @project = Project.friendly.find(params[:id])
  end
end