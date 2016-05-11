module V1
  class EventsController < ApplicationController
    before_action :set_event, only: [:show, :update, :destroy]
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  
    # GET /events
    def index
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
        render json: { error: t('event_create_error') }, status: :unprocessable_entity
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
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event
        @event = Event.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def event_params
        params.require(:event).permit(:title, :description, :lat, :long, :endtime, :user).merge(user: current_user)
      end
  end
end