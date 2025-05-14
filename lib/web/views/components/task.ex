defmodule Web.Views.Components.Task do
  alias Web.Views.Components.Icons
  import Temple
  use Temple.Component

  def escape_tasks(data) when is_list(data) do
    {tasks, rest} = Keyword.pop(data, :tasks)

    Keyword.put(
      rest,
      :tasks,
      tasks |> Enum.map(fn t -> t |> Map.put(:name, HtmlEntities.encode(t.name)) end)
    )
  end

  def escape_tasks(data) do
    {tasks, rest} = Map.pop(data, :tasks)

    Map.put(
      rest,
      :tasks,
      tasks |> Enum.map(fn t -> t |> Map.put(:name, HtmlEntities.encode(t.name)) end)
    )
  end

  def list(assigns) do
    assigns = assigns |> escape_tasks()
    title_style = "text-xl font-medium text-zinc-300"

    temple do
      div id: "all-tasks",
          class:
            "w-full md:w-2/3 lg:w-1/2 flex flex-col gap-3 p-6 border border-zinc-800 rounded-xl" do
        span class: title_style do
          len = @tasks |> Enum.filter(fn e -> !e.done end) |> length()

          if len == 0 do
            "🔥 No tasks"
          else
            "🔥 You have #{len} thing to do"
          end
        end

        for t <- @tasks do
          if !t.done do
            c &task_item/1, t: t, finish: false
          end
        end

        c &add_input/1

        if @tasks |> Enum.filter(fn e -> e.done end) |> length() != 0 do
          span class: title_style <> " mt-12", do: "✨ Finished tasks"

          for t <- @tasks do
            if t.done do
              c &task_item/1, t: t, finish: true
            end
          end
        end
      end
    end
  end

  def task_item(assigns) do
    temple do
      div class: [
            "px-6 w-full py-3 rounded-md border border-zinc-600 flex justify-between items-center ",
            "line-through text-zinc-500 border-zinc-800": @finish
          ] do
        span class: "", do: @t.name

        div class: "flex gap-4 items-center" do
          if @finish do
            button "hx-swap": "outerHTML",
                   "hx-target": "#all-tasks",
                   "hx-patch": "/#{@t.id}?recover=true",
                   "hx-trigger": "click",
                   class: "cursor-pointer" do
              c &Icons.reset/1, class: "text-zinc-500 hover:text-purple-500 duration-300"
            end
          else
            button "hx-swap": "outerHTML",
                   "hx-target": "#all-tasks",
                   "hx-patch": "/#{@t.id}",
                   "hx-trigger": "click",
                   class: "cursor-pointer" do
              c &Icons.check/1, class: "text-white hover:text-green-500 duration-300"
            end
          end

          button "hx-swap": "outerHTML",
                 "hx-target": "#all-tasks",
                 "hx-delete": @t.id,
                 "hx-trigger": "click",
                 class: "cursor-pointer" do
            c &Icons.delete/1, class: "text-zinc-500 hover:text-red-500 duration-300"
          end
        end
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
