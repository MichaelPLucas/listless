defmodule Listless.List do
  use Ecto.Schema
  import Ecto.Changeset


  schema "lists" do
    field :is_public, :boolean, default: false
    field :user_id, :id
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:is_public, :user_id, :title])
    |> validate_required([:is_public, :user_id, :title])
  end
end
