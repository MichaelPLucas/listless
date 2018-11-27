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
        |> put_flash(:error, "Item creation failed!")
        |> redirect(to: "/list/" <> to_string(params["list_id"]))
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Repo.get(Item, id)
    Repo.delete(item)
    |> case do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item deleted successfully!")
        |> redirect(to: "/list/" <> to_string(item.list_id))
      {:error, error} ->
        conn
        |> put_flash(:error, "Item deletion failed!")
        |> redirect(to: "/list/" <> to_string(item.list_id))
    end
  end
end
