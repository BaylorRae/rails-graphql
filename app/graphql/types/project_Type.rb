module Types
  ProjectType = GraphQL::ObjectType.define do
    name "Project"
    description "a project"
    
    implements GraphQL::Relay::Node.interface

    global_id_field :id

    field :title, !types.String do
      resolve ->(project, args, ctx) { project.user.email.split('@')[0] + '-' + project.title }
    end

    field :user, !UserType
  end
end
