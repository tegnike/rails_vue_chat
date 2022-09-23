module Mutations
  class CreateLike < BaseMutation
    argument :message_id, ID, required: false

    type Types::LikeType

    def resolve(message_id: nil)
      Like.create!(
        message: Message.find(message_id),
        user: context[:current_user]
      )
    end
  end
end
