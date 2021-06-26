defmodule NextLevelWeek.User.Schema do
	use Ecto.Schema
	import Ecto.Changeset

	@primary_key {:id, :binary_id, autogenerate: true}
	@fields [:name, :email, :password]

	schema "users" do
		field :name, :string
		field :email, :string
		field :password, :string
		timestamps()
	end

	def changeset(params) do
		%NextLevelWeek.User.Schema{}
		|> cast(params, @fields)
		|> validate_required(@fields)
		|> validate_length(:name, min: 2)
		|> validate_format(:email, ~r/@/)
		|> validate_length(:password, min: 6)
		|> unique_constraint([:email])
	end
end
