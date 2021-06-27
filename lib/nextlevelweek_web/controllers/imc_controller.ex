defmodule NextLevelWeekWeb.Controllers.IMCController do
  use NextLevelWeekWeb, :controller

  def index(connection, params) do
    params
    |> NextLevelWeek.IMC.calculate()
    |> handle_response(connection)
  end

  defp handle_response({:ok, data}, connection),
    do: response(connection, :ok, data)

  defp handle_response({:error, data}, connection),
    do: response(connection, :bad_request, data)

  defp response(connection, status, data) do
    connection
    |> put_status(status)
    |> json(data)
  end
end
