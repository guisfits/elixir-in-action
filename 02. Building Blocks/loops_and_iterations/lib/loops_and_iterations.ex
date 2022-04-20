defmodule LoopsAndIterations.Lists do
  # Len

  def len(list) when is_list(list) do
    calculate_length(0, list)
  end

  defp calculate_length(sum, []) do
    sum
  end

  defp calculate_length(sum, [_head | tail]) do
    calculate_length(sum + 1, tail)
  end

  # Range

  def range(from, to) when is_integer(from) and is_integer(from) do
    create_range_numbers([], from, to)
  end

  defp create_range_numbers(range, from, to) when from > to do
    range
  end

  defp create_range_numbers(range, from, to) do
    range = [to | range]
    create_range_numbers(range, from, to - 1)
  end

  # Positive

  def positive(list) when is_list(list) do
    remove_negative_number([], list)
  end

  defp remove_negative_number(positive_list, []) do
    positive_list
  end

  defp remove_negative_number(positive_list, [full_h | full_t]) when full_h >= 0 do
    positive_list = positive_list ++ [full_h]
    remove_negative_number(positive_list, full_t)
  end

  defp remove_negative_number(positive_list, [_full_h | full_t]) do
    remove_negative_number(positive_list, full_t)
  end
end

