defmodule RockStoreWeb.BandResolver do
  alias RockStore.Domain

  def all_bands(_root, _args, _info) do
    bands = Domain.list_bands
    {:ok, bands}
  end
end
