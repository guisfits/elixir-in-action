defmodule TodoList do
  alias Multidict

  def new(), do: Multidict.new()

  def add_entry(todo_list, entry) do
    Multidict.add(todo_list, entry.date, entry)
  end

  def entries(todo_list, date) do
    Multidict.get(todo_list, date)
  end
end
