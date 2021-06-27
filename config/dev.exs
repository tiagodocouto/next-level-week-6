use Mix.Config

config :nextlevelweek,
       NextLevelWeek.Repo,
       username: "postgres",
       password: "postgres",
       database: "nextlevelweek_dev",
       hostname: "localhost",
       show_sensitive_data_on_connection_error: true,
       pool_size: 10

config :nextlevelweek,
       NextLevelWeekWeb.Endpoint,
       http: [
         port: 4000
       ],
       live_reload: [
         interval: 100
       ],
       debug_errors: true,
       code_reloader: true,
       check_origin: false,
       watchers: []

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :git_hooks,
  auto_install: true,
  verbose: true,
  hooks: [
    pre_commit: [
      tasks: [
        {:cmd, "mix format"},
        {:cmd, "mix hex.outdated"},
        {:cmd, "mix test --color --cover"},
        {:cmd, "echo 'success!'"}
      ]
    ]
  ]
