defmodule Mathematics.Statistics do
  @moduledoc """
  Statistics functions
  """

  @doc """
  compute the mean of an Enum

  ## Examples

      iex> Mathematics.Statistics.mean([1, 2, 3, 1, 4])
      2.2

  """
  def mean([]), do: raise Enum.EmptyError
  def mean(enumerable) do
    sum = Enum.reduce(enumerable, 0, fn (value, acc) -> acc + value end)
    sum / Enum.count(enumerable)
  end
end