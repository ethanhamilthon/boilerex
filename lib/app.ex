defmodule Boilerex.Application do
  alias Core.Repo.Connection
  use Application

  @impl true
  def start(_type, _args) do
    port = Application.get_env(:boilerex, :port, 4089)
    "server started in http://localhost:#{port}/" |> IO.puts()

    children = [
      {Plug.Cowboy, scheme: :http, plug: Web.Router.Main, options: [port: port]},
      Connection
    ]

    opts = [strategy: :one_for_one, name: Boilerex.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
