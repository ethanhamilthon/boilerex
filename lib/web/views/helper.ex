defmodule Web.Views.Helper do
  def html_to_string(data) do
    data
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
  end
end
