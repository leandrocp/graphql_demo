defmodule RockStoreWeb.BandResolver do
  alias RockStore.Domain

  def all_bands(_root, %{name: name}, _info) do
    case Domain.get_band_by_name(name) do
      nil ->
        {:error, "Band #{name} not found"}
      band ->
        {:ok, band}
    end
  end

  def all_bands(_root, %{location: location}, _info) do
    case Domain.filter_by_location(location) do
      nil ->
        {:error, "Band from #{location} not found"}
      bands ->
        {:ok, bands}
    end
  end

  def all_bands(_root, _args, _info) do
    bands = Domain.list_bands
    {:ok, bands}
  end
end
