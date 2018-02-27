defmodule RockStore.Repo.Migrations.CreateIndexUniqueBandName do
  use Ecto.Migration

  def change do
    create unique_index(:bands, [:name])
  end
end
