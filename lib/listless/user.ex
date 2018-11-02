defmodule Listless.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:email, :string, autogenerate: false}

  schema "users" do
    field :password, :string
    field :display_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :display_name])
    |> validate_required([:email, :password, :display_name])
    |> unique_constraint(:email)
  end
end
