defmodule NextLevelWeekWeb.GraphQL.Schema.User do
  use Absinthe.Schema.Notation

  @desc "User Schema"
  object :user do
    field :trainings, list_of(:training)
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
  end

  @desc "Create User Schema"
  input_object :create_user_input do
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :password, non_null(:string)
  end
end
