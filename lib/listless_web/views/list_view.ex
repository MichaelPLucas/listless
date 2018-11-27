defmodule ListlessWeb.ListView do
  use ListlessWeb, :view
  import Ecto.Query, only: [from: 2]
  alias Listless.Repo
  alias Listless.List
  alias Listless.Item

  def get_list(list_id) do
    Repo.get(List, list_id)
  end

  def list_items(list_id) do
    from(i in Item, where: i.list_id == ^list_id)
    |> Repo.all()
  end
end