defmodule NextLevelWeek.User.Create do
	def call(params) do
		params
		|> NextLevelWeek.User.Schema.changeset
		|> NextLevelWeek.Repo.insert
	end
end
