defmodule RockStoreWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Ecto, repo: RockStore.Repo

  alias RockStoreWeb.BandResolver

  object :band do
    field :id, non_null(:id)
    field :bio, non_null(:string), description: "Short bio"
    field :location, non_null(:string), description: "Country of origin"
    field :name, non_null(:string), description: "Full name"
    field :rating, non_null(:integer), description: "From 0 to 100"
    field :albums, list_of(:album), resolve: assoc(:albums)
  end

  object :album do
    field :id, non_null(:id)
    field :name, non_null(:string), description: "Full name"
    field :year, non_null(:integer), description: "Release year"
    field :band, :band, resolve: assoc(:band)
  end

  query do
    field :bands, non_null(list_of(non_null(:band))) do
      description "All bands"
      resolve &BandResolver.all_bands/3
    end

    field :albums, non_null(list_of(non_null(:album))) do
      description "Full catalog of albums"
      resolve &AlbumResolver.all_albums/3
    end
  end
end