module Types
  class MessageType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :posted_by, UserType, null: false, method: :user
  end
end
