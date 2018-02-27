defmodule RockStoreWeb.AlbumResolver do
  alias RockStore.Domain

  def all_albums(_root, %{year: year}, _info) do
    case Domain.filter_albums_by_year(year) do
      nil ->
        {:error, "Album from year #{year} not found"}
      albums ->
        {:ok, albums}
    end
  end

  def all_albums(_root, _args, _info) do
    albums = Domain.list_albums
    {:ok, albums}
  end
end
