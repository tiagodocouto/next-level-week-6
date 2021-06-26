use Mix.Config

config :nextlevelweek, ecto_repos: [NextLevelWeek.Repo]

config :nextlevelweek,
       NextLevelWeek.Repo,
       migration_primary_key: [
         type: :binary_id
       ],
       migration_foreign_key: [
         type: :binary_id
       ]

config :nextlevelweek,
       NextLevelWeekWeb.Endpoint,
       url: [
         host: "localhost"
       ],
       secret_key_base: "IKKsYHNRii2I7kiG4cyXlu2hd7dH9gpR2bOQoy9WL2zlnFPt+DYPizv2vwdw27qw",
       render_errors: [
         view: NextLevelWeekWeb.ErrorView,
         accepts: ~w(json),
         layout: false
       ],
       pubsub_server: NextLevelWeek.PubSub,
       live_view: [
         signing_salt: "6OGtaH20"
       ]

config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
