defmodule Web.Views.Pages.Index do
  alias Web.Views.Components.Task
  alias Web.Views.Layouts
  import Temple
  use Temple.Component

  def index_page(assigns) do
    temple do
      c &Layouts.Main.main_layout/1, title: "Index Page" do
        main class: "w-full flex flex-col gap-12 py-24 items-center" do
          h1 class: "text-4xl font-medium", do: "Task Manager"
          c &Task.list/1, tasks: @tasks
        end
      end
    end
    |> Enum.join("")
  end
end
