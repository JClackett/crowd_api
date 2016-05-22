class EventSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :latitude, :longitude, :endtime
	has_one :user, serializer: UserSerializer
end
