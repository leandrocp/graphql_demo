defmodule RockStore.Domain.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias RockStore.Domain.Album
  alias RockStore.Domain.Band


  schema "albums" do
    field :name, :string
    field :year, :integer
    belongs_to :band, Band

    timestamps()
  end

  @doc false
  def changeset(%Album{} = album, attrs) do
    album
    |> cast(attrs, [:name, :year])
    |> validate_required([:name, :year])
  end
end
