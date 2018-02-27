defmodule RockStore.Repo.Migrations.CreateBands do
  use Ecto.Migration

  def change do
    create table(:bands) do
      add :name, :string
      add :location, :string
      add :bio, :text
      add :rating, :integer

      timestamps()
    end

  end
end
