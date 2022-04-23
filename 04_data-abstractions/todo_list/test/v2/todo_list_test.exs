defmodule V2.TodoListTest do

  use ExUnit.Case
  alias V2.TodoList

  describe "new/0" do
    test "should return a new map" do
      # act
      todo_list = TodoList.new()

      # assert
      assert todo_list == %V2.TodoList{auto_id: 1, entries: %{}}
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
      assert new_todo_list == %V2.TodoList{auto_id: 2, entries: %{1 => %{date: ~D[2000-12-31], id: 1, title: "study"}}}
    end
  end

  describe "entries/2" do
    test "given a todo_list, should return all entries" do
      # arrange
      todo_list = TodoList.new()
      |> TodoList.add_entry(%{date: ~D[2000-12-31], title: "study"})
      |> TodoList.add_entry(%{date: ~D[2000-12-30], title: "gym"})
      |> TodoList.add_entry(%{date: ~D[2000-12-30], title: "work"})

      # act
      entries = TodoList.entries(todo_list, ~D[2000-12-30])

      # assert
      assert Enum.count(entries) == 2
    end
  end
end
