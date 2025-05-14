defmodule Mix.Tasks.Just do
  alias Web.Views.Components
  alias Core.Repo.Connection
  alias Core.Repo.TaskRepo
  @shortdoc "mix task for testing some things"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    Connection.start_link(0)

    Components.Task.list(tasks: TaskRepo.list())
    |> Phoenix.HTML.Safe.to_iodata()
    |> IO.iodata_to_binary()
    |> IO.inspect()

    IO.puts("hello")
  end
end
