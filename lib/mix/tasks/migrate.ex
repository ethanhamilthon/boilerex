defmodule Mix.Tasks.Migrate do
  alias Core.Repo.Connection
  alias Core.Repo.TaskRepo
  @shortdoc "Simple migration mix task"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    Connection.start_link(0)
    TaskRepo.migrate()
    IO.puts("migrated 🚀")
  end
end
