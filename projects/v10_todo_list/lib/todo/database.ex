defmodule Todo.Database do
  def child_spec(_) do
    db_settings = Application.fetch_env!(:todo, :database)
    db_folder = Keyword.fetch!(db_settings, :folder)
    db_poolsize = Keyword.fetch!(db_settings, :pool_size)

    File.mkdir_p!(db_folder)

    :poolboy.child_spec(
      __MODULE__,
      [
        name: {:local, __MODULE__},
        worker_module: Todo.DatabaseWorker,
        size: db_poolsize
      ],
      [db_folder]
    )
  end

  def store(key, data) do
    :poolboy.transaction(
      __MODULE__,
      fn worker_pid ->
        Todo.DatabaseWorker.store(worker_pid, key, data)
      end
    )
  end

  def get(key) do
    :poolboy.transaction(
      __MODULE__,
      fn worker_pid ->
        Todo.DatabaseWorker.get(worker_pid, key)
      end
    )
  end
end
