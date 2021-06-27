defmodule NextLevelWeekWeb.GraphQL.Schema.Training do
  use Absinthe.Schema.Notation

  @desc "Training Schema"
  object :training do
    field :exercises, list_of(:exercise)
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
  end

  @desc "Create Training Schema"
  input_object :create_training_input do
    field :user_id, non_null(:uuid4)
    field :exercises, list_of(:create_exercise_input)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
  end
end
