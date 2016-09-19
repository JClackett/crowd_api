class MessagesController < ApplicationController
	before_action :authenticate
	before_action :set_event

	# GET /messages
	def index
		@messages = @event.messages

		render json: @messages , each_serializer: Messages::IndexSerializer
	end

	# POST /messages
	def create
		@message = Message.new(message_params)
		@message.user_id = @user.id

		if @message.save
			render json: @message, status: :created, location: @message
		else
			render json: @message.errors, status: :unprocessable_entity
		end
	end


	private

	def set_event
		@event = Event.find(params[:event_id])
	end

	# Only allow a trusted parameter "white list" through.
	def message_params
		params.require(:message).permit(:content, :event_id)
	end
end
