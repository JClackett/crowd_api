class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :lat, :long, :endtime, :user_id
end
