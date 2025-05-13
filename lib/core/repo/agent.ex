defmodule Core.Repo.TaskAgent do
  use Agent

  def start_link(_opts) do
    Agent.start_link(
      fn ->
        [
          %{
            id: 1,
            name: "task 1"
          },
          %{
            id: 2,
            name: "task 2"
          },
          %{
            id: 3,
            name: "task 3"
          }
        ]
      end,
      name: __MODULE__
    )
  end

  def add(task) do
    Agent.update(__MODULE__, fn state -> state ++ [task] end)
  end

  def list do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def clear do
    Agent.update(__MODULE__, fn _ -> [] end)
  end

  def delete(id) do
    Agent.update(__MODULE__, fn state ->
      Enum.filter(state, fn task -> task.id != id end)
    end)
  end
end
