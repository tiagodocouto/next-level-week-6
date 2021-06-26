defmodule NextLevelWeekWeb.Schema.Root do
  use Absinthe.Schema.Notation
  import_types NextLevelWeekWeb.Schema.User

  @desc "Root Schema"
  object :root do
    field :get_user, type: :user do
      arg :id, non_null(:uuid4)
      resolve &NextLevelWeekWeb.Resolver.User.get/2
    end
  end
end
