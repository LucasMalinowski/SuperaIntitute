class Admins::RolesController < AdminsController
  layout 'admin_layout'

  before_action :set_admins_role, only: %i[ show edit update destroy ]

  # GET /admins/roles or /admins/roles.json
  def index
    @admins_roles = Admins::Role.all
  end

  # GET /admins/roles/1 or /admins/roles/1.json
  def show
  end

  # GET /admins/roles/new
  def new
    @admins_role = Admins::Role.new
  end

  # GET /admins/roles/1/edit
  def edit
  end

  # POST /admins/roles or /admins/roles.json
  def create
    @admins_role = Admins::Role.new(admins_role_params)

    respond_to do |format|
      if @admins_role.save
        format.html { redirect_to admins_role_url(@admins_role), notice: "Role was successfully created." }
        format.json { render :show, status: :created, location: @admins_role }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admins_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/roles/1 or /admins/roles/1.json
  def update
    respond_to do |format|
      if @admins_role.update(admins_role_params)
        format.html { redirect_to admins_role_url(@admins_role), notice: "Role was successfully updated." }
        format.json { render :show, status: :ok, location: @admins_role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admins_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/roles/1 or /admins/roles/1.json
  def destroy
    @admins_role.destroy

    respond_to do |format|
      format.html { redirect_to admins_roles_url, notice: "Role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_role
      @admins_role = Admins::Role.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_role_params
      params.require(:admins_role).permit(:name, :description, :location, :company, :salary, :contact, :email, :requirements, :image, benefits: [])
    end
end
