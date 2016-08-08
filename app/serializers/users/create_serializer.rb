class Users::CreateSerializer < ActiveModel::Serializer
	attributes :name, :access_token, :facebook_picture
end
