module Mutations
  class CreateMessage < BaseMutation
    # arguments passed to the `resolve` method
    argument :content, String, required: true

    # return type from the mutation
    type Types::MessageType

    def resolve(content: nil)
      Message.create!(
        user: context[:current_user],
        content: content,
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
