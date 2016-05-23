class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  before_action :authenticate

  # GET /events
  def index

      coords = [params[:latitude], params[:longitude]]

     # @events = Event.near(coords, 1000)
     @events = Event.all

      render json: @events , each_serializer: EventSerializer

  end

  # GET /events/1
  def show
    render json: @event, serializer: EventSerializer
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, serializer: EventSerializer
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

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(access_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end

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
