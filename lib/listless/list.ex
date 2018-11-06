defmodule Listless.List do
  use Ecto.Schema
  import Ecto.Changeset


  schema "lists" do
    field :is_public, :boolean, default: false
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:is_public])
    |> validate_required([:is_public])
  end
end
