module Mutations
  class CreateMessage < BaseMutation
    # arguments passed to the `resolve` method
    argument :content, String, required: true

    # return type from the mutation
    type Types::MessageType

    def resolve(content: nil)
      Message.create!(
        user_id: 1,
        content: content,
      )
    end
  end
end
