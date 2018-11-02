defmodule ListlessWeb.LoginController do
  use ListlessWeb, :controller
  alias Listless.Repo
  alias Listless.User

  def index(conn, _params) do
    render conn, "index.html"
  end

  def login(conn, params) do
    %{ password: password } = Repo.get(User, params["email"])
    if password == params["password"] do
      redirect(conn, to: "/")
    else
      conn
      |> put_flash(:error, "Invalid email or password. Please try again.")
      |> redirect(to: "/login")
    end
  end
end
