class Users::CreateSerializer < ActiveModel::Serializer
	attributes :id, :name, :access_token, :facebook_picture
end
