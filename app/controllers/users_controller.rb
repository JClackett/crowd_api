class UsersController < ApplicationController

	def index
		@users = User.all

		render json: @users, via_serializer: UserSerializer
	end

	def create

		user_auth_id = user_params.slice(:uid)
		@user = User.find_or_create_by(user_auth_id)

		profile = User.koala(user_params)
		@user.update_details(profile, user_params)

		if @user.save
			render json: @user, serializer: UserSerializer, root: nil
		else
			render json: { error: ('user_create_error') }, status: :unprocessable_entity
		end
	end

	private

	def user_params
		params.require(:user).permit(:auth_token, :uid)
	end

end
