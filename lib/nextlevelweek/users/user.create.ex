defmodule NextLevelWeek.Schema.User.Create do
  def call(params) do
    params
    |> NextLevelWeek.Schema.User.changeset()
    |> NextLevelWeek.Repo.insert()
  end
end
