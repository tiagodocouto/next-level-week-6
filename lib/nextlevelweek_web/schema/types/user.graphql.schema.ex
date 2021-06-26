defmodule NextLevelWeekWeb.Schema.Types.User do
  use Absinthe.Schema.Notation
  import_types NextLevelWeekWeb.Schema.Types.UUID4

  @desc "User Schema"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end
end
