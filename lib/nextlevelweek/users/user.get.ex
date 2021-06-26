defmodule NextLevelWeek.User.Get do
  import NextLevelWeek.Helpers.Guards

  def call(%{:email => email}) do
    NextLevelWeek.User.Schema
    |> NextLevelWeek.Repo.get_by(email: email)
    |> handle_response
  end

  def call(id) when is_uuid?(id) do
    NextLevelWeek.User.Schema
    |> NextLevelWeek.Repo.get(id)
    |> handle_response
  end

  def call(_params),
    do: {:error, "field not available", binding()}

  defp handle_response(response) do
    case response do
      nil -> {:error, "user not found"}
      user -> {:ok, user}
    end
  end
end
