module Types
  class MessageType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
  end
end
