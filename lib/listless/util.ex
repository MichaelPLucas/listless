defmodule Listless.Util do
  def convert_to_uuid(id) do
    base16 = Base.encode16(Base.decode64!(id), case: :lower)
    uuid = String.slice(base16, 0..7) <> "-" <>
           String.slice(base16, 8..11) <> "-" <>
           String.slice(base16, 12..15) <> "-" <> 
           String.slice(base16, 16..19) <> "-" <> 
           String.slice(base16, 20..32)
    Ecto.UUID.cast!(uuid)
  end

  def convert_to_base64(id) do
    Base.encode64(Base.decode16!(String.replace(to_string(id), "-", ""), case: :lower))
  end
end