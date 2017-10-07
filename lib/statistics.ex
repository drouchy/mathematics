defmodule Mathematics.Statistics do
  require Integer

  @moduledoc """
  Statistics functions
  """

  @doc """
  compute the mean of an enumerable

  ## Examples

      iex> Mathematics.Statistics.mean([1, 2, 3, 1, 4])
      2.2

  """
  def mean([]), do: raise Enum.EmptyError
  def mean(enumerable) do
    sum = Enum.reduce(enumerable, 0, fn (value, acc) -> acc + value end)
    sum / Enum.count(enumerable)
  end

  @doc """
  compute the median of an enumerable

  ## Examples

      iex> Mathematics.Statistics.median([1, 3, 3, 6, 7, 8, 9])
      6

      iex> Mathematics.Statistics.median([1, 2, 3, 4, 5, 6, 8, 9])
      4.5

  """
  def median([]), do: raise Enum.EmptyError
  def median(enumerable) do
    sorted = Enum.sort(enumerable)
    cond do
      Integer.is_odd(Enum.count(sorted)) ->
        Enum.at(sorted, div(Enum.count(sorted), 2))
      Integer.is_even(Enum.count(sorted)) ->
          middle = div(Enum.count(sorted), 2)
          mean([Enum.at(sorted, middle - 1), Enum.at(sorted, middle)])
    end
  end
end