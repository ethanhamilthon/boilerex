defmodule Core.Repo.Helper do
  alias Exqlite.Sqlite3

  def fetch_all_rows(conn, query) do
    {:ok, stmt} = Sqlite3.prepare(conn, query)

    Stream.repeatedly(fn -> Sqlite3.step(conn, stmt) end)
    |> Enum.take_while(fn
      :done -> false
      {:row, _} -> true
    end)
    |> Enum.map(fn {:row, values} ->
      values
    end)
  end

  def execute(conn, query, binds) when is_list(binds) and is_binary(query) do
    {:ok, stt} =
      Sqlite3.prepare(
        conn,
        query
      )

    :ok = Sqlite3.bind(stt, binds)
    :done = Sqlite3.step(conn, stt)
    :ok = Sqlite3.release(conn, stt)
  end
end
