defmodule NextLevelWeekWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :nextlevelweek

  @session_options [
    store: :cookie,
    key: "_nextlevelweek_key",
    signing_salt: "1jGHbngX"
  ]

  socket "/socket",
         NextLevelWeekWeb.UserSocket,
         websocket: true,
         longpoll: false

  socket "/live",
         Phoenix.LiveView.Socket,
         websocket: [
           connect_info: [
             session: @session_options
           ]
         ]

  plug Plug.Static,
    at: "/",
    from: :nextlevelweek,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :nextlevelweek
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug NextLevelWeekWeb.Router
end
