class Events::IndexSerializer < ActiveModel::Serializer
	attributes :id, :latitude, :longitude
	has_one :creator, serializer: Users::ShowSerializer
end
