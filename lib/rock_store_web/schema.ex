defmodule RockStoreWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Ecto, repo: RockStore.Repo

  alias RockStoreWeb.BandResolver
  alias RockStoreWeb.AlbumResolver

  @desc "A rock band"
  object :band do
    field :id, non_null(:id)
    field :name, non_null(:string), description: "Full name"
    field :location, non_null(:string), description: "Country of origin"
    field :bio, non_null(:string), description: "Short bio"
    field :rating, non_null(:integer), description: "From 0 to 100"
    field :albums, list_of(:album), resolve: assoc(:albums)
  end

  @desc "Album of a rock band"
  object :album do
    field :id, non_null(:id)
    field :name, non_null(:string), description: "Full name"
    field :year, non_null(:integer), description: "Release year"
    field :band, :band, resolve: assoc(:band)
  end

  query do
    field :bands, non_null(list_of(non_null(:band))) do
      description "All bands"
      arg :name, :string, description: "Filter by name"
      arg :location, :string, description: "Filter by location"
      resolve &BandResolver.all_bands/3
    end

    field :albums, non_null(list_of(non_null(:album))) do
      description "Full catalog of albums"
      arg :year, :string, description: "Filter by year"
      resolve &AlbumResolver.all_albums/3
    end
  end

  mutation do
    field :register_band, :band do
      description "Register a new Band into the catalog"
      arg :name, non_null(:string)
      arg :location, non_null(:string)
      arg :bio, non_null(:string)
      arg :rating, non_null(:integer)
      resolve &BandResolver.register_band/3
    end
  end
end
