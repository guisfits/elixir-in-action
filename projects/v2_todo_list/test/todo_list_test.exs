defmodule TodoListTest do
  use ExUnit.Case, async: true

  alias TodoList

  describe "new/1" do
    test "when no entries are provided, should return a new empty TodoList" do
      # act
      todo_list = TodoList.new()

      # assert
      assert todo_list == %TodoList{auto_id: 1, entries: %{}}
    end

    test "when entries are provided, should return a new TodoList with the entries" do
      # arrange
      entries = [
        %{date: ~D[2018-12-19], title: "Dentist"},
        %{date: ~D[2018-12-20], title: "Shopping"},
        %{date: ~D[2018-12-19], title: "Movies"}
      ]

      # act
      todo_list = TodoList.new(entries)

      # assert
      assert Enum.count(todo_list.entries) == 3
    end
  end

  describe "add_entry/2" do
    test "Given a todo_list and an entry, should return a new todo_list with the new entry" do
      # arrange
      todo_list = TodoList.new()
      entry = %{date: ~D[2000-12-31], title: "study"}

      # act
      new_todo_list = TodoList.add_entry(todo_list, entry)

      # assert
      assert new_todo_list == %TodoList{
               auto_id: 2,
               entries: %{1 => %{date: ~D[2000-12-31], id: 1, title: "study"}}
             }
    end
  end

  describe "entries/2" do
    test "given a todo_list, should return all entries" do
      # arrange
      todo_list = create_fullfil_todolist()

      # act
      entries = TodoList.entries(todo_list, ~D[2000-12-30])

      # assert
      assert Enum.count(entries) == 2
    end
  end

  describe "update_entry/3" do
    test "Given a entry_id and a todo_list with entry with the given id, should update the value of the entry and return todo_list" do
      # arrange
      todo_list = create_fullfil_todolist()
      entry_id = 1
      new_date = ~D[2018-12-20]

      # act
      new_todolist = TodoList.update_entry(todo_list, entry_id, &Map.put(&1, :date, new_date))

      # assert
      {_id, entry} = find_entry(new_todolist, entry_id)
      assert entry.date == new_date
    end
  end

  describe "delete_entry/2" do
    test "Given a todo_list and a entry id, when this entry exists, should return a new todo_list without the entry" do
      # arrange
      todo_list = create_fullfil_todolist()
      entry_id = 2

      # act
      new_todolist = TodoList.delete_entry(todo_list, entry_id)

      # assert
      entry = find_entry(new_todolist, entry_id)
      assert is_nil(entry)
    end

    test "Given a todo_list and nonexisting entry_id, should return todo_list with no modifications" do
      # arrange
      todo_list = create_fullfil_todolist()
      entry_id = 4

      # act
      new_todolist = TodoList.delete_entry(todo_list, entry_id)

      # assert
      assert Enum.count(todo_list.entries) == Enum.count(new_todolist.entries)
    end
  end

  defp create_fullfil_todolist do
    TodoList.new()
    |> TodoList.add_entry(%{date: ~D[2000-12-31], title: "study"})
    |> TodoList.add_entry(%{date: ~D[2000-12-30], title: "gym"})
    |> TodoList.add_entry(%{date: ~D[2000-12-30], title: "work"})
  end

  defp find_entry(todo_list, entry_id) do
    Enum.find(
      todo_list.entries,
      nil,
      fn {id, _entry} -> id == entry_id end
    )
  end
end
