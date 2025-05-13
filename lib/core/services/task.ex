defmodule Core.Services.TaskService do
  alias Core.Repo.TaskAgent

  def list do
    TaskAgent.list()
  end

  def add(name) do
    tasks = TaskAgent.list()
    new_task = %{id: List.last(tasks).id + 1, name: name}
    TaskAgent.add(new_task)
    tasks ++ [new_task]
  end

  def delete(id) do
    parsed_id = String.to_integer(id)
    TaskAgent.delete(parsed_id)
    TaskAgent.list()
  end
end
