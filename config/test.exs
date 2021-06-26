use Mix.Config

config :nextlevelweek,
       NextLevelWeek.Repo,
       username: "postgres",
       password: "postgres",
       database: "nextlevelweek_test#{System.get_env("MIX_TEST_PARTITION")}",
       hostname: "localhost",
       pool: Ecto.Adapters.SQL.Sandbox

config :nextlevelweek,
       NextLevelWeekWeb.Endpoint,
       http: [
         port: 4002
       ],
       server: false

config :logger, level: :warn
