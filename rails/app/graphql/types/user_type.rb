module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :messages, [Types::MessageType], null: false
    field :likes, [Types::LikeType], null: false
  end
end
