defmodule Listless.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}

  schema "users" do
    field :email, :string
    field :password, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :name])
    |> validate_required([:email, :password, :name])
    |> unique_constraint(:email)
    |> hash_password()
  end

  def hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
end
