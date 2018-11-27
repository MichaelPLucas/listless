defmodule ListlessWeb.ItemController do
  use ListlessWeb, :controller
  alias Listless.Repo
  alias Listless.Item

  def create(conn, params) do
    %Item{}
    |> Item.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item created successfully!")
        |> redirect(to: "/list/" <> to_string(item.list_id))
      {:error, error} ->
        conn
        |> put_flash(:error, "Item creation failed!" <> error)
        |> redirect(to: "/list/" <> to_string(params["list_id"]))
    end
  end
end
