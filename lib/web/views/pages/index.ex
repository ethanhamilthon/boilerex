defmodule Web.Views.Pages.Index do
  alias Web.Views.Components.Task
  alias Web.Views.Layouts
  import Temple
  use Temple.Component

  def index_page(assigns) do
    temple do
      c &Layouts.Main.main_layout/1, title: "Index Page" do
        main class: "w-full flex flex-col gap-12 py-24 px-8 items-center" do
          h1 class: "text-4xl font-medium", do: "📝 Task Manager"
          c &Task.list/1, tasks: @tasks

          span class: "text-zinc-500" do
            "starterkit by "

            a href: "https://github.com/ethanhamilthon",
              target: "_blank",
              class: "hover:underline underline-none underline-white",
              do: "@ethanhamilthon"
          end
        end
      end
    end
  end
end
