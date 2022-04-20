defmodule LoopsAndIterations.ListsTest do
  use ExUnit.Case
  doctest LoopsAndIterations.Lists

  alias LoopsAndIterations.Lists

  describe "len/1" do
    test "given a list with N elements, should return N" do
      # arrange
      list = ["a", "b", "c"]

      # act
      length = Lists.len(list)

      # assert
      assert length == 3
    end
  end

  describe "range/2" do
    test "given two integers, should return the range between them" do
      # arrange
      from = 0
      to = 5

      # act
      range = Lists.range(from, to)

      # assert
      assert range == [0, 1, 2, 3, 4, 5]
    end
  end

  describe "positive/1" do
    test "given a list with positive and negative numbers, should return a list with only positive elements" do
      # arrange
      list = [0, -2, 4, -7, 1, 2, -8, -20, -4, 10]

      # act
      positive_list = Lists.positive(list)

      # assert
      assert positive_list == [0, 4, 1, 2, 10]
    end
  end
end
