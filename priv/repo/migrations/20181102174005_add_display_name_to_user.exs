defmodule Listless.Repo.Migrations.AddDisplayNameToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :display_name, :string
    end
  end
end
