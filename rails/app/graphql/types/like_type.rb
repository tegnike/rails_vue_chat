module Types
  class LikeType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :message, Types::MessageType, null: false
  end
end
