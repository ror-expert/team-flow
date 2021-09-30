class EventStreamsController < ApplicationController
  before_action :set_event_stream, only: %i[ show edit update destroy ]

  # GET /event_streams or /event_streams.json
  def index
    @event_streams = EventStream.all
  end

  # GET /event_streams/1 or /event_streams/1.json
  def show
  end

  # GET /event_streams/new
  def new
    @event_stream = EventStream.new
  end

  # GET /event_streams/1/edit
  def edit
  end

  # POST /event_streams or /event_streams.json
  def create
    @event_stream = EventStream.new(event_stream_params)

    respond_to do |format|
      if @event_stream.save
        format.html { redirect_to @event_stream, notice: "Event stream was successfully created." }
        format.json { render :show, status: :created, location: @event_stream }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_streams/1 or /event_streams/1.json
  def update
    respond_to do |format|
      if @event_stream.update(event_stream_params)
        format.html { redirect_to @event_stream, notice: "Event stream was successfully updated." }
        format.json { render :show, status: :ok, location: @event_stream }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_streams/1 or /event_streams/1.json
  def destroy
    @event_stream.destroy
    respond_to do |format|
      format.html { redirect_to event_streams_url, notice: "Event stream was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_stream
      @event_stream = EventStream.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_stream_params
      params.require(:event_stream).permit(:name, :description, :project)
    end
end
