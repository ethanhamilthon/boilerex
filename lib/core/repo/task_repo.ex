defmodule Core.Repo.TaskRepo do
  alias Core.Repo.Helper
  alias Exqlite.Sqlite3
  alias Core.Repo.Connection

  defmodule TaskModel do
    defstruct [:id, :name, :done]
  end

  def list do
    Connection.get_conn()
    |> Helper.fetch_all_rows("select * from tasks")
    |> Enum.map(fn [id, name, done] ->
      %TaskModel{
        id: id,
        name: name,
        done:
          case done do
            "true" -> true
            "false" -> false
          end
      }
    end)
  end

  def create(id, name, done) do
    Connection.get_conn()
    |> Helper.execute(
      """
      insert into tasks (id, name, done) values (?,?,?)
      """,
      [id, name, done]
    )
  end

  def create(%{id: id, name: name, done: done}) do
    Connection.get_conn()
    |> Helper.execute(
      """
      insert into tasks (id, name, done) values (?,?,?)
      """,
      [id, name, done]
    )
  end

  def update(id, done) when is_boolean(done) do
    Connection.get_conn()
    |> Helper.execute("update tasks set done = ? where id = ?", [done, id])
  end

  def update(id, name, done) do
    Connection.get_conn()
    |> Helper.execute("update tasks set done = ?, name = ? where id = ?", [done, name, id])
  end

  def delete(id) do
    Connection.get_conn()
    |> Helper.execute("delete from tasks where id = ?", [id])
  end

  def migrate() do
    :ok =
      Connection.get_conn()
      |> Sqlite3.execute("""
      create table if not exists tasks (
                id int primary key,
                name text not null,
                done boolean not null
      );
      """)
  end
end
