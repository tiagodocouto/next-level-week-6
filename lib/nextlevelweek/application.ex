defmodule NextLevelWeek.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      NextLevelWeek.Repo,
      NextLevelWeekWeb.Telemetry,
      {Phoenix.PubSub, name: NextLevelWeek.PubSub},
      NextLevelWeekWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: NextLevelWeek.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    NextLevelWeekWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
