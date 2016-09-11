class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  before_action :authenticate

  # GET /events
  def index

    coords = [params[:latitude], params[:longitude]]

    @events = Event.near(coords, 10).where("endtime > ?", Time.now)
     # @events = Event.all

    render json: @events , each_serializer: Events::IndexSerializer

  end

  # GET /events/1
  def show
    render json: @event, serializer: Events::ShowSerializer
  end

  # POST /events
  def create
    
    @event = Event.new(event_params)
    @event.user_id = @user.id

    endtime = Time.now + event_params[:endtime].hours
    @event.endtime = endtime

    if @event.save
      render json: @event
    else
      render json: { error: ('event_create_error') }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  protected


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:title, :description, :latitude, :longitude, :endtime, :user_id)
    end
end
