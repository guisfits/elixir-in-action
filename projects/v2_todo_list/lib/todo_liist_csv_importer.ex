defmodule TodoList.CsvImporter do
  def import(path) do
    File.stream!(path)
    |> Stream.map(&remove_breakline/1)
    |> Stream.map(&convert_to_tuple/1)
    |> Enum.map(&create_entry/1)
    |> TodoList.new()
  end

  defp remove_breakline(line) do
    String.replace(line, "\n", "")
  end

  defp convert_to_tuple(line) do
    line
    |> String.split(",")
    |> convert_date()
  end

  defp convert_date([date, title]) do
    [year, month, day] =
      String.split(date, "/")
      |> Enum.map(fn date_string -> String.to_integer(date_string) end)

    {{year, month, day}, title}
  end

  defp create_entry({{year, month, day}, title}) do
    %{
      date: Date.new!(year, month, day),
      title: title
    }
  end
end
