class GuestsController < ApplicationController
  before_action :set_guest, only: [:update, :destroy]
  before_action :set_event
  # before_action :authenticate

  # GET /guests
  def index
    @guests = @event.guests
    render json: @guests
  end

  # POST /guests
  def create
    
    @guest = Guest.new(guest_params)

    if @guest.save
      render json: @guest
    else
      render json: { error: ('guest_create_error') }, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @guest.destroy
  end

  protected


  private

    def set_event
      @event = Event.find(params[:event_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def guest_params
      params.require(:guest).permit(:event_id, :user_id)
    end
end
