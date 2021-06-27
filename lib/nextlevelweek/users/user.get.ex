defmodule NextLevelWeek.Schema.User.Get do
  import Ecto.Query
  import NextLevelWeek.Helpers.Guards

  def call(%{:email => email}) do
    NextLevelWeek.Schema.User
    |> NextLevelWeek.Repo.get_by(email: email)
    |> handle_response
  end

  def call(id) when is_uuid?(id) do
    NextLevelWeek.Schema.User
    |> NextLevelWeek.Repo.get(id)
    |> handle_response
  end

  def call(_params),
    do: {:error, "field not available", binding()}

  defp handle_response(response) when is_nil(response),
    do: {:error, "user not found"}

  defp handle_response(response) do
    today = Date.utc_today()

    query =
      from t in NextLevelWeek.Schema.Training,
        where: ^today >= t.start_date and ^today <= t.end_date,
        order_by: t.start_date,
        limit: 1

    user =
      response
      |> NextLevelWeek.Repo.preload(trainings: {first(query), :exercises})

    {:ok, user}
  end
end
