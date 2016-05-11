module V1
	class EventSerializer < ActiveModel::Serializer
	  attributes :id, :title, :description, :lat, :long, :endtime
	  has_one :user, serializer: V1::UserSerializer 
	end
end
