defmodule NextLevelWeek.Schema.Training.Create do
  def call(params) do
    params
    |> NextLevelWeek.Schema.Training.changeset()
    |> NextLevelWeek.Repo.insert()
  end
end
