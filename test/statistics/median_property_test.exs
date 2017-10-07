defmodule Mathematics.Statistics.MedianTest do
  use ExUnit.Case, async: true
  use EQC.ExUnit

  alias Mathematics.Statistics

  @moduletag :quickcheck
  @nb_tests Application.get_env(:mathematics, :nb_test_per_check, 100)

  @tag numtests: @nb_tests
  property 'at least 50% of the value in the enum above the median' do
    forall enumerable <- non_empty(list(int())) do
      median = Statistics.median(enumerable)

      above = Enum.filter(enumerable, fn (value) -> value <= median end)

      Enum.count(above) >= Enum.count(enumerable) / 2
    end
  end

  @tag numtests: @nb_tests
  property 'at least 50% of the value in the enum below the median' do
    forall enumerable <- non_empty(list(int())) do
      median = Statistics.median(enumerable)

      below = Enum.filter(enumerable, fn (value) -> value >= median end)

      Enum.count(below) >= Enum.count(enumerable) / 2
    end
  end
end