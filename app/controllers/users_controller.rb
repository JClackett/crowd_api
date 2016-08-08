class UsersController < ApplicationController
	before_action :authenticate, except: :create

	def index
		@users = User.all

		render json: @users, via_serializer: Users::IndexSerializer
	end

	def create
		
		facebook_id = user_params.slice(:facebook_id)
		@user = User.find_or_create_by(facebook_id)

		profile = User.koala(user_params)
		
		@user.update_details(profile, user_params)

		if @user.save
			render json: @user, serializer: Users::CreateSerializer, root: nil
		else
			render json: { error: ('user_create_error') }, status: :unprocessable_entity
		end
	end

	private

	def user_params
		params.require(:user).permit(:facebook_id, :facebook_auth_token)
	end

end
