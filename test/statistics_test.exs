defmodule Mathematics.StatisticsTest do
  use ExUnit.Case, async: true
  alias Mathematics.Statistics

  doctest Statistics

  test 'mean can not be computed on an empty enumerable' do
    assert_raise Enum.EmptyError, fn () -> Statistics.mean([]) end
  end

  test 'median can not be computed on an empty enumerable' do
    assert_raise Enum.EmptyError, fn () -> Statistics.median([]) end
  end

  test 'median accepts unsorted enum' do
    assert Statistics.median([4, 8, 2, 3, 5, 1, 9, 6]) == 4.5
  end
end