defmodule NextLevelWeekWeb.Router do
  use NextLevelWeekWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NextLevelWeekWeb do
    pipe_through :api
    get "/imc", Controllers.IMCController, :index
  end

  scope "/api" do
    pipe_through :api
    forward "/graphql", Absinthe.Plug, schema: NextLevelWeek.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: NextLevelWeek.Schema
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: NextLevelWeekWeb.Telemetry
    end
  end
end
