defmodule Core.Repo.Connection do
  use GenServer

  def start_link(_) do
    db_path = Application.get_env(:boilerex, :db_path)
    GenServer.start_link(__MODULE__, db_path, name: __MODULE__)
  end

  def get_conn() do
    GenServer.call(__MODULE__, :get_conn)
  end

  @impl true
  def init(db_path) do
    {:ok, conn} = Exqlite.Sqlite3.open(db_path)
    {:ok, conn}
  end

  @impl true
  def handle_call(:get_conn, _from, conn) do
    {:reply, conn, conn}
  end
end
