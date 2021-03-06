defmodule ListlessWeb.LoginController do
  use ListlessWeb, :controller
  alias Listless.Auth

  def index(conn, _params) do
    render conn, "index.html"
  end

  def login(conn, params) do
    case Auth.login(params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.email)
        |> redirect(to: "/")
      {:error, _error} ->
        conn
        |> put_flash(:error, "Invalid email or password. Please try again.")
        |> redirect(to: "/login")
    end
  end

  def logout(conn, params) do
    conn
    |> delete_session(:current_user)
    |> redirect(to: "/")
  end
end
