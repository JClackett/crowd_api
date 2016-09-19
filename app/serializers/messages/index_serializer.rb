class Messages::IndexSerializer < ActiveModel::Serializer
	attribute :id
	attribute :content
	has_one :creator, serializer: Users::ShowSerializer

end
