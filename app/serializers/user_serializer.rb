class UserSerializer < ActiveModel::Serializer
	attributes :uid, :name, :auth_token, :email, :picture

	has_many :events , serializer: EventSerializer
end
