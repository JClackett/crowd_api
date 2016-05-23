class UserSerializer < ActiveModel::Serializer
	attributes :name, :email, :access_token, :facebook_id, :facebook_auth_token, :facebook_picture
end
