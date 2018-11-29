defmodule Listless.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "items" do
    field :title, :string
    field :image, :string
    field :link, :string
    field :price, :decimal
    field :tags, {:array, :string}
    field :list_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    new_attrs = %{attrs | "tags" => convert_tags(attrs["tags"])}
    item
    |> cast(new_attrs, [:title, :image, :link, :price, :tags, :list_id])
    |> validate_required([:title, :image, :link, :price, :tags, :list_id])
  end

  def convert_tags(tags) when is_list(tags) do tags end
  def convert_tags(tags) when is_bitstring(tags) do Regex.split(~r/\s*,\s*/, tags) end
end
