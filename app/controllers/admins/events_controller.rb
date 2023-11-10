class Admins::EventsController < AdminsController
  layout 'admin_layout'

  before_action :set_admins_event, only: %i[ show edit update destroy ]

  # GET /admins/events or /admins/events.json
  def index
    @admins_events = Admins::Event.all
  end

  # GET /admins/events/1 or /admins/events/1.json
  def show
  end

  # GET /admins/events/new
  def new
    @admins_event = Admins::Event.new
  end

  # GET /admins/events/1/edit
  def edit
  end

  # POST /admins/events or /admins/events.json
  def create
    @admins_event = Admins::Event.new(admins_event_params)

    respond_to do |format|
      if @admins_event.save
        format.html { redirect_to admins_event_url(@admins_event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @admins_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admins_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/events/1 or /admins/events/1.json
  def update
    respond_to do |format|
      if @admins_event.update(admins_event_params)
        format.html { redirect_to admins_event_url(@admins_event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @admins_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admins_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/events/1 or /admins/events/1.json
  def destroy
    @admins_event.destroy

    respond_to do |format|
      format.html { redirect_to admins_events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_event
      @admins_event = Admins::Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_event_params
      params.require(:admins_event).permit(:name, :description, :date, :location)
    end
end
