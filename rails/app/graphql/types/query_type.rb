module Types
  class QueryType < Types::BaseObject
    # queries are just represented as fields
    # `all_messages` is automatically camelcased to `allLinks`
    field :get_messages, [MessageType], null: false

    # this method is invoked, when `all_link` fields is being resolved
    def get_messages
      Message.all
    end
  end
end
