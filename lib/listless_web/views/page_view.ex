defmodule ListlessWeb.PageView do
  use ListlessWeb, :view

  def get_extension(conn) do
    uuid = to_string(Listless.Auth.current_user(conn).id)
    Base.encode64(Base.decode16!(String.replace(uuid, "-", ""), case: :lower))
  end
end
