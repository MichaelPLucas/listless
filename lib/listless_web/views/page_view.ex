defmodule ListlessWeb.PageView do
  use ListlessWeb, :view

  def get_extension(conn) do
    uuid = to_string(Listless.Auth.current_user(conn).id)
    Listless.Util.convert_to_base64(uuid)
  end
end
