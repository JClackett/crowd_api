class Users::IndexSerializer < ActiveModel::Serializer
	attributes :name, :access_token, :facebook_picture, :email
end
