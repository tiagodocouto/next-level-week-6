defmodule NextLevelWeekWeb.Schema.Root do
  use Absinthe.Schema.Notation
  import_types NextLevelWeekWeb.Schema.User

  @desc "Root Schema"
  object :root_query do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)
      resolve &NextLevelWeekWeb.Resolver.User.get/2
    end
  end

  object :root_mutation do
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)
      resolve &NextLevelWeekWeb.Resolver.User.create/2
    end
  end
end
