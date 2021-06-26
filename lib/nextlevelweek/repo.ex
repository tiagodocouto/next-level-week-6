defmodule NextLevelWeek.Repo do
  use Ecto.Repo,
    otp_app: :nextlevelweek,
    adapter: Ecto.Adapters.Postgres
end
