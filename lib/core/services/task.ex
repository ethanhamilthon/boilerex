defmodule Core.Services.TaskService do
  alias Core.Repo.TaskRepo

  def list do
    TaskRepo.list()
  end

  def add(name) do
    tasks = TaskRepo.list()

    new_task =
      if length(tasks) == 0 do
        %{id: 1, name: name, done: false}
      else
        %{id: List.last(tasks).id + 1, name: name, done: false}
      end

    TaskRepo.create(new_task)
    tasks ++ [new_task]
  end

  def delete(id) do
    parsed_id = String.to_integer(id)
    TaskRepo.delete(parsed_id)
    TaskRepo.list()
  end

  def done(id) do
    parsed_id = String.to_integer(id)
    TaskRepo.update(parsed_id, true)
    TaskRepo.list()
  end

  def recover(id) do
    parsed_id = String.to_integer(id)
    TaskRepo.update(parsed_id, false)
    TaskRepo.list()
  end
end
