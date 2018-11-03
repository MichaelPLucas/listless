defmodule ListlessWeb.UserController do
  use ListlessWeb, :controller
  import Logger
  alias Listless.User
  alias Listless.Repo

  def create(conn, params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, user} ->
        put_flash(conn, :info, "Account created successfully. Welcome to Listless!")
        case Listless.Auth.login(params) do
          {:ok, user} ->
            redirect(conn, to: "/")
          {:error, error} ->
            conn
            |> put_flash(:error, "Something went horribly wrong. This should never happen. Please contact a developer ASAP.")
            |> redirect(to: "/login")
        end
      {:error, errors} ->
        conn
        |> put_flash(:error, "Something went wrong. Please try again.")
        |> redirect(to: login_path(conn, :index))
    end
  end
end