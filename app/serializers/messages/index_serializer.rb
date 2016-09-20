class Messages::IndexSerializer < ActiveModel::Serializer
	attribute :id
	attribute :content
	attribute :created_at 
	has_one :creator, serializer: Users::ShowSerializer

end
