defmodule Listless.Repo.Migrations.StringToText do
  use Ecto.Migration

  def change do
    alter table(:items) do
      modify :title, :text
      modify :image, :text
      modify :link, :text
    end
  end
end
