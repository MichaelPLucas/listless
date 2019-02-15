defmodule ListlessWeb.UserController do
  use ListlessWeb, :controller
  alias Listless.User
  alias Listless.Repo

  def index(conn, %{"user_id" => user_id}) do
    render(conn, "index.html", user_id: user_id)
  end

  def create(conn, params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, _user} ->
        put_flash(conn, :info, "Account created successfully. Welcome to Listless!")
        case Listless.Auth.login(params) do
          {:ok, _user} ->
            conn
            |> put_session(:current_user, params.email)
            |> redirect(to: "/")
          {:error, _error} ->
            conn
            |> put_flash(:error, "Something went horribly wrong. This should never happen. Please contact a developer ASAP.")
            |> redirect(to: "/login")
        end
      {:error, _errors} ->
        conn
        |> put_flash(:error, "Something went wrong. Please try again.")
        |> redirect(to: login_path(conn, :index))
    end
  end
end