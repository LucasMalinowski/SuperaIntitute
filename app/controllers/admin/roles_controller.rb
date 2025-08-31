class Admin::RolesController < Admin::BaseController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.includes(:creator).order(created_at: :desc)
                 .page(params[:page]).per(20)
  end

  def show
  end

  def new
    @role = Role.new
  end

  def edit
  end

  def create
    @role = Role.new(role_params)
    @role.creator = current_user

    if @role.save
      redirect_to admin_role_path(@role), notice: 'Role was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      redirect_to admin_role_path(@role), notice: 'Role was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @role.destroy
    redirect_to admin_roles_path, notice: 'Role was successfully deleted.'
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :description, :location, :company, :salary,
                                 :contact, :email, :requirements, :image, :published,
                                 benefits: [])
  end
end