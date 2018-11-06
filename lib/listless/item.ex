defmodule Listless.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "items" do
    field :image, :string
    field :link, :string
    field :price, :decimal
    field :tags, {:array, :string}
    field :title, :string
    field :list_id, :id

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:title, :image, :link, :price, :tags])
    |> validate_required([:title, :image, :link, :price, :tags])
  end
end
