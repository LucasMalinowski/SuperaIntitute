class Admins::ProjectsController < AdminsController
  layout 'admin_layout'

  before_action :set_admins_project, only: %i[ show edit update destroy ]

  # GET /admins/projects or /admins/projects.json
  def index
    @admins_projects = Admins::Project.all
  end

  # GET /admins/projects/1 or /admins/projects/1.json
  def show
  end

  # GET /admins/projects/new
  def new
    @admins_project = Admins::Project.new
  end

  # GET /admins/projects/1/edit
  def edit
  end

  # POST /admins/projects or /admins/projects.json
  def create
    @admins_project = Admins::Project.new(admins_project_params)

    respond_to do |format|
      if @admins_project.save
        format.html { redirect_to admins_project_url(@admins_project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @admins_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admins_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/projects/1 or /admins/projects/1.json
  def update
    respond_to do |format|
      if @admins_project.update(admins_project_params)
        format.html { redirect_to admins_project_url(@admins_project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @admins_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admins_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/projects/1 or /admins/projects/1.json
  def destroy
    @admins_project.destroy

    respond_to do |format|
      format.html { redirect_to admins_projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_project
      @admins_project = Admins::Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_project_params
      params.require(:admins_project).permit(:name, :description, :location, :contact, :image, :date)
    end
end
