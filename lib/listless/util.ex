defmodule Listless.Util do
  def convert_to_uuid(id) do
    base16 = id
    |> String.replace("-", "+")
    |> String.replace("_", "/")
    |> Base.decode64!(case: :lower)
    |> Base.encode16()
    uuid = String.slice(base16, 0..7) <> "-" <>
           String.slice(base16, 8..11) <> "-" <>
           String.slice(base16, 12..15) <> "-" <> 
           String.slice(base16, 16..19) <> "-" <> 
           String.slice(base16, 20..32)
    Ecto.UUID.cast!(uuid)
  end

  def convert_to_base64(id) do
    to_string(id)
    |> String.replace("-", "")
    |> Base.decode16!(case: :lower)
    |> Base.encode64()
    |> String.replace("+", "-")
    |> String.replace("/", "_")
  end
end