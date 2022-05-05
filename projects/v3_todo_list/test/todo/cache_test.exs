defmodule Todo.Cache.Test do
  use ExUnit.Case
  alias Todo.Cache

  describe "server_process/2" do
    test "Given a name, should attach it to some Todo.Server pid" do
      # arrange
      {:ok, cache} = Todo.Cache.start()

      # act
      guilherme_pid = Todo.Cache.server_process(cache, "guilherme")

      # assert
      assert guilherme_pid != Todo.Cache.server_process(cache, "juliana")
      assert guilherme_pid == Todo.Cache.server_process(cache, "guilherme")
    end

    test "Given a Todo.Server pid, Should do all Todo.List operations" do
      # arrange
      {:ok, cache} = Todo.Cache.start()
      alice = Todo.Cache.server_process(cache, "alice")

      # act
      Todo.Server.add_entry(alice, %{date: ~D[2018-12-19], title: "Dentist"})
      entries = Todo.Server.entries(alice, ~D[2018-12-19])

      # assert
      assert [%{date: ~D[2018-12-19], title: "Dentist"}] = entries
    end
  end
end
