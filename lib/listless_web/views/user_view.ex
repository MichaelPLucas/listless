defmodule ListlessWeb.UserView do
  use ListlessWeb, :view
  import Ecto.Query, only: [from: 2]
  alias Listless.Repo
  alias Listless.List

  def created_lists(user_id) do
    from(l in List, where: l.user_id == ^user_id)
    |> Repo.all()
  end
end