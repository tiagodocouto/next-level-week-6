defmodule NextLevelWeekWeb.GraphQL.Schema.Root do
  use Absinthe.Schema.Notation
  import_types NextLevelWeekWeb.GraphQL.Custom.UUID4
  import_types NextLevelWeekWeb.GraphQL.Schema.User
  import_types NextLevelWeekWeb.GraphQL.Schema.Training
  import_types NextLevelWeekWeb.GraphQL.Schema.Exercise

  @desc "Root Schema"
  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)
      resolve &NextLevelWeekWeb.GraphQL.Resolver.User.get/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)
      resolve &NextLevelWeekWeb.GraphQL.Resolver.User.create/2
      middleware Crudry.Middlewares.TranslateErrors
    end

    field :create_training, type: :training do
      arg :input, non_null(:create_training_input)
      resolve &NextLevelWeekWeb.GraphQL.Resolver.Training.create/2
      middleware Crudry.Middlewares.TranslateErrors
    end
  end
end
