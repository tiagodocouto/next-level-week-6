defmodule NextLevelWeek.MixProject do
	use Mix.Project

	def project do
		[
			app: :nextlevelweek,
			version: "0.1.0",
			elixir: "~> 1.12",
			elixirc_paths: elixirc_paths(Mix.env()),
			compilers: [:phoenix, :gettext] ++ Mix.compilers(),
			start_permanent: Mix.env() == :prod,
			aliases: aliases(),
			deps: deps()
		]
	end

	def application do
		[
			mod: {NextLevelWeek.Application, []},
			extra_applications: [:logger, :runtime_tools, :os_mon]
		]
	end

	defp elixirc_paths(:test), do: ["lib", "test/support"]
	defp elixirc_paths(_), do: ["lib"]

	defp deps do
		[
			{:phoenix, "~> 1.5.9"},
			{:phoenix_ecto, "~> 4.1"},
			{:ecto_sql, "~> 3.4"},
			{:postgrex, ">= 0.0.0"},
			{:phoenix_live_dashboard, "~> 0.4"},
			{:phoenix_live_reload, "~> 1.3"},
			{:telemetry_metrics, "~> 0.4"},
			{:telemetry_poller, "~> 0.4"},
			{:gettext, "~> 0.11"},
			{:jason, "~> 1.0"},
			{:plug_cowboy, "~> 2.0"},
			{:absinthe, "~> 1.6.4"},
			{:absinthe_plug, "~> 1.5.8"}
		]
	end

	defp aliases do
		[
			setup: ["deps.get", "ecto.setup"],
			"ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
			"ecto.reset": ["ecto.drop", "ecto.setup"],
			test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
		]
	end
end
