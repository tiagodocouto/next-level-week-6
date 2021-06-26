defmodule NextLevelWeekWeb.Schema.User do
  use Absinthe.Schema.Notation
  import_types NextLevelWeekWeb.Custom.UUID4

  @desc "User Schema"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  @desc "Create User Schema"
  input_object :create_user_input do
    field :name, non_null(:string), description: "USER NAME"
    field :email, non_null(:string), description: "USER EMAIL"
    field :password, non_null(:string), description: "USER PASSWORD"
  end
end
