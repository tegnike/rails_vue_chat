module Mutations
  class CreateLike < BaseMutation
    argument :message_id, ID, required: false

    type Types::LikeType

    def resolve(message_id: nil)
      Like.create!(
        message: Message.find(message_id),
        user: context[:current_user]
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
