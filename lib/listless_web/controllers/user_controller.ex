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
        conn
        |> put_flash(:info, "Account created successfully. Welcome to Listless!")
        |> ListlessWeb.LoginController.login(params)
      {:error, errors} ->
        conn
        |> put_flash(:error, "Something went wrong. Please try again.")
        |> redirect(to: login_path(conn, :index))
    end
  end
end