defmodule Web.Router.Main do
  alias Core.Services.TaskService
  alias Web.Views.Components.Task
  alias Web.Views.Pages.Index
  use Plug.Router
  plug(Plug.Logger)

  plug(Plug.Static,
    at: "/",
    from: "priv/static",
    only: ~w(favicon.ico assets)
  )

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart],
    pass: ["*/*"],
    length: 10_000_000
  )

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> send_resp(200, Index.index_page(tasks: TaskService.list()))
  end

  post "/" do
    tasks = conn.params["name"] |> TaskService.add()

    conn
    |> send_resp(200, Task.list(tasks: tasks))
  end

  delete "/:id" do
    tasks = conn.params["id"] |> TaskService.delete()

    conn
    |> send_resp(200, Task.list(tasks: tasks))
  end

  patch "/:id" do
    tasks =
      case conn.query_params do
        %{"recover" => "true"} ->
          conn.params["id"] |> TaskService.recover()

        _ ->
          conn.params["id"] |> TaskService.done()
      end

    conn
    |> send_resp(200, Task.list(tasks: tasks))
  end

  match _ do
    send_resp(conn, 404, "Not found path")
  end
end
