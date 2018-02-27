defmodule RockStoreWeb.AlbumResolver do
  alias RockStore.Domain

  def all_albums(_root, _args, _info) do
    albums = Domain.list_albums
    {:ok, albums}
  end
end
