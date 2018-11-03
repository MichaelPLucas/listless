defmodule Listless.Auth do
  alias Listless.Repo
  alias Listless.User

  def login(params) do
    user = Repo.get_by(User, email: params["email"])

    cond do
      user && user.password == params["password"] ->
        {:ok, user}
      true ->
        {:error, :unauthorized}
    end
  end

  def current_user(conn) do
    curr_user = Plug.Conn.get_session(conn, :current_user)
    if curr_user, do: Repo.get_by(User, email: curr_user)
  end

  def logged_in?(conn) do
    !!(current_user(conn))
  end
end