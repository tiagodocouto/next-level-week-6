defmodule NextLevelWeek.Schema.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @fields [:name, :youtube_video_url, :protocol_description, :repetitions]

  schema "exercises" do
    belongs_to :training, NextLevelWeek.Schema.Training
    field :name, :string
    field :youtube_video_url, :string
    field :protocol_description, :string
    field :repetitions, :string
    timestamps()
  end

  def changeset(exercise, params) do
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
