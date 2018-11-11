defmodule Listless.Repo.Migrations.AddListName do
  use Ecto.Migration

  def change do
    alter table(:lists) do
      add :title, :string
    end
  end
end
