class EventSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :lat, :long, :endtime
	has_one :user, serializer: UserSerializer
end
