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
    case Domain.filter_bands_by_location(location) do
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

  def register_band(_root, args, _info) do
    case Domain.create_band(args) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not register band!",
          details: error_details(changeset)
        }
      success ->
        success
    end
  end

  def error_details(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(fn {msg, _} -> msg end)
  end
end
