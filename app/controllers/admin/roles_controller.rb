# frozen_string_literal: true

module Admin
  class RolesController < ApplicationController
    before_action :set_role, only: %i[show edit update destroy]

    def index
      @roles = Role.all.page(params[:page]).per(20)
      authorize @roles
    end

    def show
      authorize @role
    end

    def new
      @role = Role.new
      authorize @role
    end

    def edit
      authorize @role
    end

    def create
      @role = Role.new(role_params)
      authorize @role
      if @role.save
        redirect_to admin_role_path(@role), notice: t('roles.created')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      authorize @role
      if @role.update(role_params)
        redirect_to admin_role_path(@role), notice: t('roles.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize @role
      @role.destroy
      redirect_to admin_roles_path, notice: t('roles.destroyed')
    end

    private

    def set_role
      @role = Role.friendly.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name, :description, :company, :location, :salary, :contact, :email, :requirements, { benefits: [] }, :image)
    end
  end
end