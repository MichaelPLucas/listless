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
        |> redirect(to: ("/list/" + list.id))
      {:error, _error} ->
        put_flash(conn, :error, "Failed to create list. Please try again.")
    end
  end
end