module Types
  class MutationType < Types::BaseObject
    field :create_message, mutation: Mutations::CreateMessage
    field :create_like, mutation: Mutations::CreateLike
  end
end
