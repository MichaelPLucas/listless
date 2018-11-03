defmodule Listless.Repo.Migrations.EnsureUserFieldsNotNull do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :email, :string, null: false
      modify :password, :string, null: false
      modify :display_name, :string, null: false
    end
  end
end
