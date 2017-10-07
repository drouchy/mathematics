defmodule Mathematics.StatisticsTest do
  use ExUnit.Case, async: true
  alias Mathematics.Statistics

  doctest Statistics

  test 'mean can not be computed on an empty enumerable' do
    assert_raise Enum.EmptyError, fn () -> Statistics.mean([]) end
  end
end