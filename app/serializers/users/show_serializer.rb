class Users::ShowSerializer < ActiveModel::Serializer
	attributes :id, :name, :facebook_picture
end
