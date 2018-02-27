defmodule RockStore.Domain.Band do
  use Ecto.Schema
  import Ecto.Changeset
  alias RockStore.Domain.Band
  alias RockStore.Domain.Album


  schema "bands" do
    field :bio, :string
    field :location, :string
    field :name, :string
    field :rating, :integer
    has_many :albums, Album

    timestamps()
  end

  @doc false
  def changeset(%Band{} = band, attrs) do
    band
    |> cast(attrs, [:name, :location, :bio, :rating])
    |> validate_required([:name, :location, :bio, :rating])
  end
end
