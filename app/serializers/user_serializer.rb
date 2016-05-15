class UserSerializer < ActiveModel::Serializer
	attributes :uid, :name, :auth_token, :email
end
