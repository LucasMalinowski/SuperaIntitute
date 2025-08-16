# frozen_string_literal: true

module Admin
  class ProjectsController < ApplicationController
    before_action :set_project, only: %i[show edit update destroy]

    def index
      @projects = Project.all.page(params[:page]).per(20)
      authorize @projects
    end

    def show
      authorize @project
    end

    def new
      @project = Project.new
      authorize @project
    end

    def edit
      authorize @project
    end

    def create
      @project = Project.new(project_params)
      authorize @project
      if @project.save
        redirect_to admin_project_path(@project), notice: t('projects.created')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize @project
      if @project.update(project_params)
        redirect_to admin_project_path(@project), notice: t('projects.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @project
      @project.destroy
      redirect_to admin_projects_path, notice: t('projects.destroyed')
    end

    private

    def set_project
      @project = Project.friendly.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :location, :contact, :starts_at, :ends_at, :image)
    end
  end
end