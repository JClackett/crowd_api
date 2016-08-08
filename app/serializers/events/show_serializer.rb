class Events::ShowSerializer < ActiveModel::Serializer
	attributes :id, :title, :description
	has_one :creator, serializer: Users::ShowSerializer
	has_many :users, serializer: Users::ShowSerializer
end
