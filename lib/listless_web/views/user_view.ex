defmodule ListlessWeb.UserView do
  use ListlessWeb, :view
  import Ecto.Query, only: [from: 2]
  alias Listless.Repo
  alias Listless.List

  def created_lists(user_id) do
    from(l in List, where: l.user_id == ^user_id)
    |> Repo.all()
  end

  def convert_to_uuid(user_id) do
    id = Base.encode16(Base.decode64!(user_id), case: :lower)
    uuid = String.slice(id, 0..7) <> "-" <>
           String.slice(id, 8..11) <> "-" <>
           String.slice(id, 12..15) <> "-" <> 
           String.slice(id, 16..19) <> "-" <> 
           String.slice(id, 20..32)
    Ecto.UUID.cast!(uuid)
  end
end