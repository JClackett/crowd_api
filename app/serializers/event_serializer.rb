class EventSerializer < ActiveModel::Serializer
	attributes :id, :title, :description, :latitude, :longitude, :endtime
end
