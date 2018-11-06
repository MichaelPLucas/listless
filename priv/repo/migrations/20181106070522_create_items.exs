defmodule Listless.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :title, :string
      add :image, :string
      add :link, :string
      add :price, :decimal
      add :tags, {:array, :string}
      add :list_id, references(:lists, on_delete: :nothing)

      timestamps()
    end

    create index(:items, [:list_id])
  end
end
