defmodule Web.Views.Components.Task do
  import Temple
  use Temple.Component

  def list(assigns) do
    IO.inspect(assigns)

    temple do
      div id: "all-tasks",
          class: "w-1/2 flex flex-col gap-3 p-6 border border-zinc-800 rounded-xl" do
        if length(@tasks) == 0 do
          span class: "text-2xl font-medium", do: "🔥 No tasks"
        else
          for t <- @tasks do
            div class:
                  "px-6 w-full py-3 rounded-md border border-zinc-600 flex justify-between items-center" do
              span class: "", do: t.name

              button "hx-delete": "/#{t.id}",
                     "hx-swap": "outerHTML",
                     "hx-target": "#all-tasks",
                     "hx-trigger": "click",
                     class: "cursor-pointer",
                     do: "❌"
            end
          end
        end

        c &add_input/1
      end
    end
  end

  def add_input(_) do
    temple do
      form class: "w-full relative",
           "hx-post": "/",
           "hx-swap": "outerHTML",
           "hx-target": "#all-tasks" do
        input id: "add-name-input",
              name: "name",
              type: "text",
              placeholder: "Title of the task",
              class:
                "w-full px-6 py-3 placeholder:text-zinc-700 rounded-md border border-zinc-600 focus:outline-none"

        button type: "submit",
               class:
                 "absolute top-1/2 cursor-pointer -translate-y-1/2 right-3 text-zinc-500 duration-300 hover:text-zinc-200",
               do: "Enter ⏎"
      end

      script do
        """
        document.getElementById("add-name-input").focus();
        """
      end
    end
  end
end
