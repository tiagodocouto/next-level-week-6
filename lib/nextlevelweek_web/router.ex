defmodule NextLevelWeekWeb.Router do
	use NextLevelWeekWeb, :router

	pipeline :api do
		plug :accepts, ["json"]
	end

	scope "/api", NextLevelWeekWeb do
		pipe_through :api
		get "/imc", Controllers.IMCController, :index
	end

	if Mix.env() in [:dev, :test] do
		import Phoenix.LiveDashboard.Router
		scope "/" do
			pipe_through [:fetch_session, :protect_from_forgery]
			live_dashboard "/dashboard", metrics: NextLevelWeekWeb.Telemetry
		end
	end
end
