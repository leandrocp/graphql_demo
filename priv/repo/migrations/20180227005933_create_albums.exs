defmodule RockStore.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :name, :string
      add :year, :integer
      add :band_id, references(:bands, on_delete: :nothing)

      timestamps()
    end

    create index(:albums, [:band_id])
  end
end
