Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(root, args, ctx) {
      "Hello World!"
    }
  end

  field :me, Types::UserType do
    description "the current user"
    resolve ->(root, args, ctx) { User.first }
  end

  field :projects, types[Types::ProjectType] do
    description "the projects for the current user"
    resolve ->(root, args, ctx) { Project.all }
  end
end
