class TimeFlowMonitorsController < ApplicationController
  before_action :set_time_flow_monitor, only: %i[ show edit update destroy ]

  # GET /time_flow_monitors or /time_flow_monitors.json
  def index
    @time_flow_monitors = TimeFlowMonitor.all
  end

  # GET /time_flow_monitors/1 or /time_flow_monitors/1.json
  def show
  end

  # GET /time_flow_monitors/new
  def new
    @time_flow_monitor = TimeFlowMonitor.new
  end

  # GET /time_flow_monitors/1/edit
  def edit
  end

  # POST /time_flow_monitors or /time_flow_monitors.json
  def create
    @time_flow_monitor = TimeFlowMonitor.new(time_flow_monitor_params)

    respond_to do |format|
      if @time_flow_monitor.save
        format.html { redirect_to @time_flow_monitor, notice: "Time flow monitor was successfully created." }
        format.json { render :show, status: :created, location: @time_flow_monitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_flow_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_flow_monitors/1 or /time_flow_monitors/1.json
  def update
    respond_to do |format|
      if @time_flow_monitor.update(time_flow_monitor_params)
        format.html { redirect_to @time_flow_monitor, notice: "Time flow monitor was successfully updated." }
        format.json { render :show, status: :ok, location: @time_flow_monitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_flow_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_flow_monitors/1 or /time_flow_monitors/1.json
  def destroy
    @time_flow_monitor.destroy
    respond_to do |format|
      format.html { redirect_to time_flow_monitors_url, notice: "Time flow monitor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_flow_monitor
      @time_flow_monitor = TimeFlowMonitor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_flow_monitor_params
      params.require(:time_flow_monitor).permit(:name, :description, :project_id)
    end
end
