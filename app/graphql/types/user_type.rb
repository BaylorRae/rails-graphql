module Types
  UserType = GraphQL::ObjectType.define do
    name "User"
    description "a user"

    implements GraphQL::Relay::Node.interface

    global_id_field :id
    field :email, !types.String
  end
end
