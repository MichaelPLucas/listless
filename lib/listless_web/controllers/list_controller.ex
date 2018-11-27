defmodule ListlessWeb.ListController do
  use ListlessWeb, :controller
  alias Listless.Repo
  alias Listless.List

  def index(conn, %{"list_id" => list_id}) do
    render(conn, "index.html", list_id: list_id)
  end

  def create(conn, params) do
    %List{}
    |> List.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, list} ->
        conn
        |> put_flash(:info, "List created successfully!")
        |> redirect(to: ("/list/" <> to_string(list.id)))
      {:error, _error} ->
        conn
        |> put_flash(:error, "Failed to create list. Please try again.")
        |> redirect(to: "/user/" <> to_string(params.user_id))
    end
  end
end
