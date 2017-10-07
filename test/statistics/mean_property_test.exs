defmodule Mathematics.Statistics.MeanTest do
  use ExUnit.Case, async: true
  use EQC.ExUnit

  alias Mathematics.Statistics

  @moduletag :quickcheck
  @nb_tests Application.get_env(:mathematics, :nb_test_per_check, 100)

  @tag numtests: @nb_tests
  property 'the sum of the distance of each element with the mean is zero' do
    forall enumerable <- list(int()) do
      implies length(enumerable) > 0 do
        mean = Statistics.mean(enumerable)

        assert_in_delta Enum.reduce(enumerable, 0, fn(value, acc) -> acc + value - mean end), 0, 0.00000000001
      end
    end
  end
end