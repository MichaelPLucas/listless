defmodule Listless.Repo.Migrations.InitialSetup do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :name, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false

      timestamps()
    end

    create table(:lists, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :user_id, references(:users, on_delete: :delete_all, type: :uuid)
      add :title, :string, null: false
      add :email, :string, null: false
      add :password, :string, null: false

      timestamps()
    end

    create table(:items, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :list_id, references(:lists, on_delete: :delete_all, type: :uuid)
      add :title, :string, null: false
      add :is_public, :boolean, default: true, null: false
      
      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:lists, [:user_id])
    create unique_index(:items, [:list_id])
  end
end
